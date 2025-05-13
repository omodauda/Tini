//
//  SittingAreaView.swift
//  Tini
//
//  Created by Omodauda on 12/05/2025.
//

import UIKit

class SittingAreaView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "Sitting area"
        return label
    }()
    
    private let options = ["Any", "Inside", "Outside"]
        
    private var buttons: [UIButton] = []
        
    private let stackView = UIStackView()

    var selectedOption: String? {
        return buttons.first(where: { $0.isSelected })?.title(for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(stackView)

            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])

            options.forEach { title in
                let button = createButton(withTitle: title)
                buttons.append(button)
                stackView.addArrangedSubview(button)
            }

//             Optional: Set initial selection
            updateSelection(selected: buttons.first)
        }
    
    private func createButton(withTitle title: String) -> UIButton {
            let button = UIButton()
            button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(hex: Colors.titleText), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.backgroundColor = .white
            button.layer.cornerRadius = 16
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }

        @objc private func buttonTapped(_ sender: UIButton) {
            updateSelection(selected: sender)
        }

        private func updateSelection(selected: UIButton?) {
            buttons.forEach {
                $0.isSelected = ($0 == selected)
                $0.layer.borderColor = $0.isSelected ? UIColor(hex: Colors.primary).cgColor : UIColor(hex: "#DDDDe3").cgColor
                $0.setTitleColor($0.isSelected ? UIColor(hex: Colors.primary) : UIColor(hex: Colors.titleText), for: .normal)
                $0.titleLabel?.font = .systemFont(ofSize: 14, weight: $0.isSelected ? .bold : .regular)
            }
        }
    
    
}
