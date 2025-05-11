//
//  ReservationViewTableViewCell.swift
//  Tini
//
//  Created by Omodauda on 08/05/2025.
//

import UIKit

class ReservationViewTableViewCell: UITableViewCell {
    
    static let identifier = "ReservationViewTableViewCell"
    
    private let cardView: UIView = {
        let card = UIView()
        card.layer.cornerRadius = 8
        card.backgroundColor = .white
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let statusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .red
        return view
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reserved"
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let contactSupportBtn = CustomButton(title: "Contact support", backgroundColor: nil, image: nil)
    
    private let cancelBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle( "Cancel", for: .normal)
        btn.setTitleColor(UIColor(hex: Colors.primary), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        return btn
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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        backgroundColor = .clear
        
        addSubview(cardView)
        
        cardView.addSubview(statusView)
        statusView.addSubview(statusLabel)
        
        stackView.addArrangedSubview(createRow(icon: Images.storeIcon!, text: "SB CMT8"))
        stackView.addArrangedSubview(createDivider())
        stackView.addArrangedSubview(createRow(icon: UIImage(systemName: "figure.stand")!, text: "Table for 2"))
        stackView.addArrangedSubview(createDivider())
        stackView.addArrangedSubview(createRow(icon: Images.clockIcon!, text: "Today 14/02, 13:00"))
        
        cardView.addSubview(stackView)
        
        cardView.addSubview(contactSupportBtn)
        cardView.addSubview(cancelBtn)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            statusView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            statusView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            
            statusLabel.topAnchor.constraint(equalTo: statusView.topAnchor, constant: 4),
            statusLabel.leadingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 12),
            statusLabel.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -12),
            statusLabel.bottomAnchor.constraint(equalTo: statusView.bottomAnchor, constant: -4),
            
            contactSupportBtn.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            contactSupportBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            cancelBtn.centerYAnchor.constraint(equalTo: contactSupportBtn.centerYAnchor),
            cancelBtn.trailingAnchor.constraint(equalTo: contactSupportBtn.leadingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contactSupportBtn.topAnchor, constant: -12)
            
        ])
    }
    
}
