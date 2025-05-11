//
//  DatePickerVC.swift
//  Tini
//
//  Created by Omodauda on 11/05/2025.
//

import UIKit
import FSCalendar

class DatePickerVC: UIViewController {
    
    var onSelect: ((Date) -> Void)?
    
    var selected: Date
    
    private let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let modalHeader = ModalHeaderView(title: "Select a date")
    
    private let calendarView: FSCalendar = {
        let calendar = FSCalendar()
        calendar.appearance.headerDateFormat = "MMMM - yyyy"
        calendar.appearance.headerTitleFont = .systemFont(ofSize: 16, weight: .regular)
        calendar.appearance.headerTitleColor = UIColor(hex: Colors.titleText)
        calendar.appearance.selectionColor = UIColor(hex: Colors.primary)
        calendar.appearance.titleFont = .systemFont(ofSize: 16, weight: .regular)
        calendar.appearance.subtitleSelectionColor = .white
        calendar.appearance.subtitleFont = .systemFont(ofSize: 16, weight: .regular)
        calendar.appearance.subtitleDefaultColor = UIColor(hex: Colors.titleText)
        calendar.appearance.borderRadius = 1
        calendar.appearance.weekdayTextColor = UIColor(hex: Colors.secondary)
        calendar.appearance.weekdayFont = .systemFont(ofSize: 16, weight: .regular)
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.today = nil
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0;
        return calendar
    }()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureFooterBtn()
    }

    init(selected: Date) {
        self.selected = selected
        calendarView.select(selected)
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
        
        view.addSubview(calendarView)
        calendarView.delegate = self
        calendarView.dataSource = self
        
        view.addSubview(footer)
        footer.addSubview(footerBtn)
        
        
        NSLayoutConstraint.activate([
            modalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            modalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modalView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.60),
            
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
            
            calendarView.topAnchor.constraint(equalTo: modalHeader.bottomAnchor),
            calendarView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            calendarView.bottomAnchor.constraint(equalTo: footer.topAnchor, constant: -8)
        ])
    }

}

extension DatePickerVC: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selected = date
    }
}
