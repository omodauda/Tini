//
//  ReservationsVC.swift
//  Tini
//
//  Created by Omodauda on 08/05/2025.
//

import UIKit
import Combine

class MyReservationsVC: UIViewController {
    
    let reservationsViewModel = ReservationsViewModel.shared
    private var cancellables = Set<AnyCancellable>()
    private var reservations: [TableReservationModel] = []
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "My reservations", showRightIcon: false, rightIcon: nil)
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ReservationViewTableViewCell.self, forCellReuseIdentifier: ReservationViewTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 237
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    private let footer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let footerBtn = CustomButton(title: "Reserve a table", backgroundColor: UIColor(hex: Colors.primary), image: nil)
    
    private let emptyReservationView = EmptyReservationView()
    
    private func goToReserveTable() {
        let vc = ReservationVC()
        navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        reservationsViewModel.reservationsPublisher.sink { [weak self] reservations in
            self?.reservations = reservations
            self?.updateView()
            self?.tableView.reloadData()
        }
        .store(in: &cancellables)
    }
    
    private func updateView() {
        if reservations.isEmpty {
            showEmptyView()
        } else {
            showTableView()
        }
    }
    
    private func showTableView() {
        emptyReservationView.isHidden = true
        tableView.isHidden = false
        
        view.addSubview(footer)
        footer.addSubview(footerBtn)
        footerBtn.addTarget(self, action: #selector(handleReserveTable), for: .touchUpInside)
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            footerBtn.topAnchor.constraint(equalTo: footer.topAnchor, constant: 8),
            footerBtn.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 16),
            footerBtn.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -16),
            footerBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            tableView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: footer.topAnchor)
        ])
    }
    
    private func showEmptyView() {
        tableView.isHidden = true
        emptyReservationView.isHidden = false
        
        view.addSubview(emptyReservationView)
        emptyReservationView.translatesAutoresizingMaskIntoConstraints = false
        emptyReservationView.goToReserveTable = { [weak self] in
            self?.goToReserveTable()
        }
        
        NSLayoutConstraint.activate([
            emptyReservationView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            emptyReservationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyReservationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyReservationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc private func handleReserveTable() {
        goToReserveTable()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.delegate = self
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerWrapper.heightAnchor.constraint(equalToConstant: 120),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
        ])
    }

}

extension MyReservationsVC: CustomNavHeaderDelegate {
    func didTapBack() {
        navigationController?.popViewController(animated: false)
    }
    
    func didTapSearch() {}
}

extension MyReservationsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReservationViewTableViewCell.identifier, for: indexPath) as? ReservationViewTableViewCell else {
            return UITableViewCell()
        }
        let reservation = reservations[indexPath.row]
        cell.configure(reservation: reservation)
        return cell
    }
}
