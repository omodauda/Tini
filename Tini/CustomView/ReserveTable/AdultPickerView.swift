//
//  AdultPickerView.swift
//  Tini
//
//  Created by Omodauda on 10/05/2025.
//

import UIKit

class AdultPickerView: UIView {
    
    var onAdultPickerPressed: (() -> Void)?
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adult"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()
    
    private let pickerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        return view
    }()
    
    private let pickerValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()
    
    private let pickerIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(hex: Colors.secondary)
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        configurePress()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(newValue: Int) {
        pickerValueLabel.text = "\(newValue)"
    }
    
    private func configurePress() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        pickerView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        onAdultPickerPressed?()
    }
    
    private func setupUI() {
        addSubview(label)
        addSubview(pickerView)
        pickerView.addSubview(pickerValueLabel)
        pickerView.addSubview(pickerIcon)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            pickerView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4),
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pickerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pickerIcon.centerYAnchor.constraint(equalTo: pickerView.centerYAnchor),
            pickerIcon.trailingAnchor.constraint(equalTo: pickerView.trailingAnchor, constant: -13),
            pickerIcon.widthAnchor.constraint(equalToConstant: 18),
            pickerIcon.heightAnchor.constraint(equalToConstant: 18),
            
            pickerValueLabel.topAnchor.constraint(equalTo: pickerView.topAnchor, constant: 10),
            pickerValueLabel.leadingAnchor.constraint(equalTo: pickerView.leadingAnchor, constant: 16),
            pickerValueLabel.bottomAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: -10),
            pickerValueLabel.trailingAnchor.constraint(equalTo: pickerIcon.leadingAnchor, constant: -16)
        ])
    }
    
}
