//
//  TimePickerCell.swift
//  Tini
//
//  Created by Omodauda on 11/05/2025.
//

import UIKit

class TimePickerCell: UICollectionViewCell {
    
    static let identifier = "TimePickerCell"
    
    private let card: UIView = {
        let card = UIView()
        card.backgroundColor = .clear
        card.layer.cornerRadius = 16
        card.layer.borderWidth = 1
        card.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "12:00"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with time: String, isSelected: Bool) {
        timeLabel.text = time
        timeLabel.textColor = isSelected ? UIColor(hex: Colors.primary) : UIColor(hex: Colors.titleText)
        timeLabel.font = .systemFont(ofSize: 14, weight: isSelected ? .bold : .regular)
        card.layer.borderColor = UIColor(hex: isSelected ? Colors.primary : "#DDDDE3").cgColor
    }
    
    private func setupUI() {
        contentView.isUserInteractionEnabled = true
        backgroundColor = .clear
        
        contentView.addSubview(card)
        card.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: topAnchor),
            card.leadingAnchor.constraint(equalTo: leadingAnchor),
            card.trailingAnchor.constraint(equalTo: trailingAnchor),
            card.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            
            timeLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 6),
            timeLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 14),
            timeLabel.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -14),
            timeLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -6)
        ])
        
    }
}
