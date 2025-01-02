//
//  PickupTimeVC.swift
//  Tini
//
//  Created by Omodauda on 01/01/2025.
//

import UIKit

class PickupTimeVC: UIViewController {
    
//    private let dates = ["Today", "Tomorrow", "02/02/2025"]
    private var dates: [String] = []
    
    private let timeData = ["00:30", "01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30", "05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30","09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30"]
    
    func generateDate(count: Int) -> [String] {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        var dates: [String] = []
        for i in 0..<count {
            if let date = calendar.date(byAdding: .day, value: i, to: Date()) {
                if i == 0 {
                    dates.append("Today")
                } else if i == 1 {
                    dates.append("Tomorrow")
                } else {
                    dates.append(dateFormatter.string(from: date))
                }
            }
        }
        return dates
    }
    
    private let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let modalHeader = ModalHeaderView(title: "Pickup time")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let dateTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "dateCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
//        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        return tableView
    }()
    
    private let timeTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "timeCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
//        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        return tableView
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.tetiary)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let footer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    private let applyBtn = CustomButton(title: "Apply", backgroundColor: UIColor(hex: Colors.primary), image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let generatedDates = generateDate(count: 30)
        dates = generatedDates
        adjustTableViewContent()
    }
    
    private func adjustTableViewContent() {
        let contentHeight = timeTableView.contentSize.height
        let tableHeight = timeTableView.bounds.height
        
        let topInset = max(0, (tableHeight - contentHeight) / 2)
        timeTableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        view.addSubview(modalView)
        modalView.addSubview(modalHeader)
        modalHeader.translatesAutoresizingMaskIntoConstraints = false
        modalHeader.delegate = self
        
        modalView.addSubview(stackView)
        stackView.addArrangedSubview(dateTableView)
        stackView.addArrangedSubview(timeTableView)
        dateTableView.delegate = self
        dateTableView.dataSource = self
        timeTableView.delegate = self
        timeTableView.dataSource = self
        
        modalView.addSubview(footer)
        footer.addSubview(applyBtn)
        applyBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            modalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modalView.heightAnchor.constraint(equalToConstant: 280),
            
            modalHeader.topAnchor.constraint(equalTo: modalView.topAnchor),
            modalHeader.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            modalHeader.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: modalHeader.bottomAnchor, constant: 18),
            stackView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: footer.topAnchor),
            
            footer.bottomAnchor.constraint(equalTo: modalView.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            
            applyBtn.topAnchor.constraint(equalTo: footer.topAnchor, constant: 8),
            applyBtn.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 16),
            applyBtn.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -16),
            applyBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}

extension PickupTimeVC: ModalHeaderViewDelegate {
    func didTapDismissButton() {
        dismiss(animated: true)
    }
}

extension PickupTimeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == dateTableView {
            return dates.count
        } else {
            return timeData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == dateTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            cell.textLabel?.text = dates[indexPath.row]
            cell.textLabel?.textColor = .black
            cell.textLabel?.textAlignment = .center
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
            cell.textLabel?.text = timeData[indexPath.row]
            cell.textLabel?.textColor = .black
            cell.textLabel?.textAlignment = .center
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 27
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        centerVisibleRow(for: scrollView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            centerVisibleRow(for: scrollView)
        }
    }
    
    private func centerVisibleRow(for scrollView: UIScrollView) {
        guard let tableView = scrollView as? UITableView else {return}
        
        let center = tableView.convert(tableView.center, from: tableView.superview)
        if let indexPath = tableView.indexPathForRow(at: center) {
            tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        }
    }
}
