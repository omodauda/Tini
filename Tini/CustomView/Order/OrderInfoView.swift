//
//  OrderInfoView.swift
//  Tini
//
//  Created by Omodauda on 17/04/2025.
//

import UIKit

class OrderInfoView: UIView {
    
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "Order ID"
        return label
    }()
    
    private let orderId: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: Colors.tetiary)
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "Order date"
        return label
    }()
    
    private let orderDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(orderId: String, orderDate: Date) {
        super.init(frame: .zero)
        self.orderId.text = orderId
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, HH:mm"
        self.orderDate.text = formatter.string(from: orderDate)
        setupUI()
    }
    
    func setupUI() {
        layer.cornerRadius = 8
        backgroundColor = .white
        
        addSubview(idLabel)
        addSubview(orderId)
        addSubview(separator)
        addSubview(dateLabel)
        addSubview(orderDate)
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            orderId.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            orderId.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            separator.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            dateLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            orderDate.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8),
            orderDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            orderDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        ])
    }
    
}
