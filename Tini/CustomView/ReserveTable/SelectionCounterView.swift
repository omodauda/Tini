//
//  SelectionCounterView.swift
//  Tini
//
//  Created by Omodauda on 12/05/2025.
//

import UIKit

class SelectionCounterView: UIView {
    
    var onDecreaseCount: (() -> Void)?
    var onIncreaseCount: (() -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: Colors.secondary)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minusBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.imageView?.tintColor = UIColor(hex: Colors.secondary)
        button.isEnabled = false
        button.isOpaque = true
        return button
    }()
    
    private let valueWrapper: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        return label
    }()
    
    private let plusBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(hex: Colors.primary).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String, subTitle: String, value: Int) {
        super.init(frame: .zero)
        titleLabel.text = title
        subtitleLabel.text = subTitle
        setupUI()
        configureBtns()
    }
    
    private func configureBtns() {
        minusBtn.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
        plusBtn.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
    }
    
    @objc private func decreaseCount() {
        onDecreaseCount?()
    }
    
    @objc private func increaseCount() {
        onIncreaseCount?()
    }
    
    private func disableBtn(_ btn: UIButton) {
        btn.isEnabled = false
        btn.isOpaque = true
        btn.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
    }
    
    private func enableBtn(_ btn: UIButton) {
        btn.isEnabled = true
        btn.isOpaque = false
        btn.layer.borderColor = UIColor(hex: Colors.primary).cgColor
        btn.imageView?.tintColor = UIColor(hex: Colors.primary)
    }
    
    func updateValue(with newValue: Int) {
        valueLabel.text = "\(newValue)"
        newValue == 0 ? disableBtn(minusBtn) : enableBtn(minusBtn)
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        stackView.addArrangedSubview(minusBtn)
        stackView.addArrangedSubview(valueWrapper)
        stackView.addArrangedSubview(plusBtn)
        addSubview(stackView)
        
        valueWrapper.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            minusBtn.widthAnchor.constraint(equalToConstant: 40),
            minusBtn.heightAnchor.constraint(equalToConstant: 40),
            
            valueWrapper.widthAnchor.constraint(equalToConstant: 40),
            valueWrapper.heightAnchor.constraint(equalToConstant: 40),
            
            valueLabel.centerXAnchor.constraint(equalTo: valueWrapper.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: valueWrapper.centerYAnchor),
            
            plusBtn.widthAnchor.constraint(equalToConstant: 40),
            plusBtn.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: stackView.leadingAnchor, constant: -4),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: stackView.leadingAnchor, constant: -4),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
