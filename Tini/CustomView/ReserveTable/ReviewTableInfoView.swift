//
//  ReviewTableInfoView.swift
//  Tini
//
//  Created by Omodauda on 12/05/2025.
//

import UIKit

class ReviewTableInfoView: UIView {
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.primary)
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.text = "This table is reserved for you"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.text = "Time remaining"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func createRow(icon: UIImage, text: String) -> UIView {
        let iconView = UIImageView(image: icon)
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.tintColor = .lightGray
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        
        let rowView = UIView()
        rowView.translatesAutoresizingMaskIntoConstraints = false
        
        rowView.addSubview(iconView)
        rowView.addSubview(label)
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: rowView.topAnchor, constant: 10),
            iconView.leadingAnchor.constraint(equalTo: rowView.leadingAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 20),
            iconView.heightAnchor.constraint(equalToConstant: 20),
            iconView.bottomAnchor.constraint(equalTo: rowView.bottomAnchor, constant: -10),
            
            label.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: rowView.trailingAnchor, constant: -10)
        ])
        return rowView
    }
    
    private func createDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = UIColor(hex: Colors.tetiary)
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return divider
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(date: Date, time: String, numberOfGuests: Int) {
        super.init(frame: .zero)
        setupUI()
        
        stackView.addArrangedSubview(createRow(icon: Images.storeIcon!, text: "SB CMT8"))
        stackView.addArrangedSubview(createDivider())
        stackView.addArrangedSubview(createRow(icon: UIImage(systemName: "figure.stand")!, text: "Table for \(numberOfGuests)"))
        stackView.addArrangedSubview(createDivider())
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        formatter.timeZone = TimeZone.current
        
        let isToday = Calendar.current.isDateInToday(date)
        let dateText = "\(isToday ? "Today" : "") \(formatter.string(from: date))"
        stackView.addArrangedSubview(createRow(icon: Images.clockIcon!, text: "\(dateText), \(time)"))
    }
    
    func updateTimer(with time: String) {
        timerLabel.text = time
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 8
        
        addSubview(headerView)
        headerView.addSubview(titleLabel)
        headerView.addSubview(subTitleLabel)
        headerView.addSubview(timerLabel)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            timerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: timerLabel.leadingAnchor, constant: -8),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: timerLabel.leadingAnchor, constant: -8),
            subTitleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8),
            
            stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
