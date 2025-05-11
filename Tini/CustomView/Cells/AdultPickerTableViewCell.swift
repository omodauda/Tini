//
//  AdultPickerTableViewCell.swift
//  Tini
//
//  Created by Omodauda on 10/05/2025.
//

import UIKit

class AdultPickerTableViewCell: UITableViewCell {
    
    static let identifier = "AdultPickerTableViewCell"
    
    private let radioButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(hex: Colors.background)
        return view
    }()
    
    private let innerRadioView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.backgroundColor = UIColor(hex: Colors.primary)
        view.isHidden = true
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "1 people"
        label.textAlignment = .left
        return label
    }()
    
    private let divider: UIView = {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(hex: "#DDDDE3")
        return divider
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(index: Int, currentSelectedIndex: Int) {
        label.text = "\(index + 1) people"
//        innerRadioView.tag = index
        if index == currentSelectedIndex {
            innerRadioView.isHidden = false
        } else {
            innerRadioView.isHidden = true
        }
    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .white
        
        addSubview(radioButtonView)
        radioButtonView.addSubview(innerRadioView)
        addSubview(label)
        addSubview(divider)
        
        NSLayoutConstraint.activate([
            radioButtonView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            radioButtonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            radioButtonView.widthAnchor.constraint(equalToConstant: 20),
            radioButtonView.heightAnchor.constraint(equalToConstant: 20),
            
            innerRadioView.centerXAnchor.constraint(equalTo: radioButtonView.centerXAnchor),
            innerRadioView.centerYAnchor.constraint(equalTo: radioButtonView.centerYAnchor),
            innerRadioView.widthAnchor.constraint(equalToConstant: 12),
            innerRadioView.heightAnchor.constraint(equalToConstant: 12),
            
            label.centerYAnchor.constraint(equalTo: radioButtonView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: radioButtonView.trailingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            divider.topAnchor.constraint(equalTo: radioButtonView.bottomAnchor, constant: 8),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            divider.heightAnchor.constraint(equalToConstant: 1),
            divider.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
