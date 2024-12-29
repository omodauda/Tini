//
//  SelectToppingView.swift
//  Tini
//
//  Created by Omodauda on 28/12/2024.
//

import UIKit

protocol SelectToppingViewDelegate: AnyObject {
    func didSelectTopping(_ topping: ProductTopping)
}

class SelectToppingView: UIView {
    
    private var toppings: [ProductTopping] = []
    private var selectedTopping: ProductTopping?
    
    weak var delegate: SelectToppingViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Topping"
        return label
    }()
    
    private let maxLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "(maximum)"
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            let hitView = super.hitTest(point, with: event)
            if let hitView = hitView, hitView.isDescendant(of: self) {
                return hitView
            }
            return nil
        }
    
    func configure(with toppings: [ProductTopping]) {
        self.toppings = toppings
        updateView()
    }
    
    private func updateView() {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        for topping in toppings {
            let view = createTopping(for: topping)
            stackView.addArrangedSubview(view)
        }
    }
    
    private func createTopping(for topping: ProductTopping) -> UIView {
        let toppingView = UIView()
        
        let checkBox: UIButton = {
            let checkBox = UIButton()
            checkBox.layer.borderWidth = 1
            checkBox.layer.cornerRadius = 4
            checkBox.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
            checkBox.translatesAutoresizingMaskIntoConstraints = false
            checkBox.backgroundColor = UIColor(hex: Colors.background)
            return checkBox
        }()
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = UIColor(hex: Colors.titleText)
            label.text = topping.name
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let priceModifierLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = UIColor(hex: Colors.secondary)
            label.text = String("+\(topping.price)")
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let separator: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(hex: Colors.tetiary)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        toppingView.addSubview(checkBox)
        toppingView.addSubview(nameLabel)
        toppingView.addSubview(priceModifierLabel)
        
        NSLayoutConstraint.activate([
            checkBox.topAnchor.constraint(equalTo: toppingView.topAnchor, constant: 18),
            checkBox.leadingAnchor.constraint(equalTo: toppingView.leadingAnchor, constant: 18),
            checkBox.bottomAnchor.constraint(equalTo: toppingView.bottomAnchor, constant: -18),
            checkBox.widthAnchor.constraint(equalToConstant: 20),
            checkBox.heightAnchor.constraint(equalToConstant: 20),
            
            nameLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: checkBox.centerYAnchor),
            
            priceModifierLabel.centerYAnchor.constraint(equalTo: checkBox.centerYAnchor),
            priceModifierLabel.trailingAnchor.constraint(equalTo: toppingView.trailingAnchor, constant: -16),
            
        ])
        
        if toppings.last?.id != topping.id {
            toppingView.addSubview(separator)
            
            NSLayoutConstraint.activate([
                separator.topAnchor.constraint(equalTo: checkBox.bottomAnchor, constant: 18),
                separator.leadingAnchor.constraint(equalTo: toppingView.leadingAnchor, constant: 16),
                separator.trailingAnchor.constraint(equalTo: toppingView.trailingAnchor, constant: -16),
                separator.heightAnchor.constraint(equalToConstant: 1),
            ])
        }
        
//        toppingView.tag = toppings.firstIndex { $0.id == topping.id } ?? 0
        if let index = toppings.firstIndex(where: { $0.id == topping.id }) {
            print(index)
            toppingView.tag = index
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapTopping(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        tapGestureRecognizer.delegate = self
        
        toppingView.addGestureRecognizer(tapGestureRecognizer)
        return toppingView
    }
    
    @objc private func didTapTopping(_ sender: UITapGestureRecognizer) {
//        print("i tapped topping")
        if let toppingView = sender.view {
            let selected = toppings[toppingView.tag]
            selectedTopping = selected
            delegate?.didSelectTopping(selected)
            
            updateSelectedToppingView()
        }
    }
    
    private func updateSelectedToppingView() {
        for view in stackView.arrangedSubviews {
            guard
                let checkBox = view.subviews.first(where: { $0.layer.cornerRadius == 4 }) as? UIButton,
                let toppingIndex = toppings.indices.first(where: { toppings[$0].id == toppings[view.tag].id }) else { continue }
            
            let isSelected = toppings[toppingIndex].id == selectedTopping?.id
            
            // Update colors based on selection
            checkBox.setImage(isSelected ? Images.checkBox : UIImage(), for: .normal)
            checkBox.layer.borderColor = UIColor(hex: isSelected ? Colors.primary : "#DDDDE3").cgColor
        }
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 8
        
        addSubview(titleLabel)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}

extension SelectToppingView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
