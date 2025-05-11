//
//  AdultPickerVC.swift
//  Tini
//
//  Created by Omodauda on 10/05/2025.
//

import UIKit

class AdultPickerVC: UIViewController {
    
    var onSelect: ((Int) -> Void)?
    
    var selected: Int
    
    private let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let modalHeader = ModalHeaderView(title: "Select number of adult")
    
    private let footer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    private let footerBtn = CustomButton(title: "Confirm", backgroundColor: UIColor(hex: Colors.primary), image: nil)
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isUserInteractionEnabled = true
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AdultPickerTableViewCell.self, forCellReuseIdentifier: AdultPickerTableViewCell.identifier)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureFooterBtn()
    }
    
    init(selected: Int) {
        self.selected = selected
        super.init(nibName: nil, bundle: nil)
        configureFooterBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFooterBtn() {
        footerBtn.addTarget(self, action: #selector(onConfirmPressed), for: .touchUpInside)
    }
    
    @objc private func onConfirmPressed() {
        onSelect?(selected)
        dismiss(animated: false)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        view.addSubview(modalView)
        modalView.addSubview(modalHeader)
        modalHeader.translatesAutoresizingMaskIntoConstraints = false
        modalHeader.onDismiss = { [weak self] in
            self?.dismiss(animated: false)
        }
        
        view.addSubview(footer)
        footer.addSubview(footerBtn)
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        NSLayoutConstraint.activate([
            modalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            modalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modalView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.81),
            
            modalHeader.topAnchor.constraint(equalTo: modalView.topAnchor),
            modalHeader.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            modalHeader.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            footerBtn.topAnchor.constraint(equalTo: footer.topAnchor, constant: 8),
            footerBtn.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 16),
            footerBtn.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -16),
            footerBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            tableView.topAnchor.constraint(equalTo: modalHeader.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: footer.topAnchor)
        ])
    }
}

extension AdultPickerVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdultPickerTableViewCell.identifier, for: indexPath) as? AdultPickerTableViewCell else { return UITableViewCell()}
        cell.configure(index: indexPath.row, currentSelectedIndex: (selected - 1))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row + 1
        tableView.reloadData()
    }
}
