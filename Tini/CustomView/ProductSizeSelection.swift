//
//  ProductSizeSelection.swift
//  Tini
//
//  Created by Omodauda on 28/12/2024.
//

import UIKit

protocol ProductSizeSelectionDelegate: AnyObject {
    func didSelectSize(_ size: ProductSize)
}

class ProductSizeSelection: UIView {
    
    private var sizes: [ProductSize] = []
    private var selectedSize: ProductSize?
    
    weak var delegate: ProductSizeSelectionDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Size"
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
    
    func configure(with sizes: [ProductSize]) {
        self.sizes = sizes
        updateView()
    }
    
    private func updateView() {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        for size in sizes {
            let view = createSize(for: size)
            stackView.addArrangedSubview(view)
        }
    }
    
    private func createSize(for size: ProductSize) -> UIView {
        let sizeView = UIView()
        let outerRadio: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 10
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(hex: Colors.background)
            return view
        }()
        let innerRadio: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 6
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let sizeLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = UIColor(hex: Colors.titleText)
            label.text = size.name
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let priceModifierLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = UIColor(hex: Colors.secondary)
            label.text = String("+\(size.priceModifier)")
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let separator: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(hex: Colors.tetiary)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        sizeView.addSubview(outerRadio)
        sizeView.addSubview(sizeLabel)
        sizeView.addSubview(priceModifierLabel)
        outerRadio.addSubview(innerRadio)
        
        NSLayoutConstraint.activate([
            outerRadio.topAnchor.constraint(equalTo: sizeView.topAnchor, constant: 18),
            outerRadio.leadingAnchor.constraint(equalTo: sizeView.leadingAnchor, constant: 18),
            outerRadio.bottomAnchor.constraint(equalTo: sizeView.bottomAnchor, constant: -18),
            outerRadio.widthAnchor.constraint(equalToConstant: 20),
            outerRadio.heightAnchor.constraint(equalToConstant: 20),
            
            sizeLabel.leadingAnchor.constraint(equalTo: outerRadio.trailingAnchor, constant: 10),
            sizeLabel.centerYAnchor.constraint(equalTo: outerRadio.centerYAnchor),
            
            priceModifierLabel.centerYAnchor.constraint(equalTo: outerRadio.centerYAnchor),
            priceModifierLabel.trailingAnchor.constraint(equalTo: sizeView.trailingAnchor, constant: -16),
            
            innerRadio.centerXAnchor.constraint(equalTo: outerRadio.centerXAnchor),
            innerRadio.centerYAnchor.constraint(equalTo: outerRadio.centerYAnchor),
            innerRadio.widthAnchor.constraint(equalToConstant: 12),
            innerRadio.heightAnchor.constraint(equalToConstant: 12),
        ])
        
        if sizes.last?.id != size.id {
            sizeView.addSubview(separator)
            
            NSLayoutConstraint.activate([
                separator.topAnchor.constraint(equalTo: outerRadio.bottomAnchor, constant: 18),
                separator.leadingAnchor.constraint(equalTo: sizeView.leadingAnchor, constant: 16),
                separator.trailingAnchor.constraint(equalTo: sizeView.trailingAnchor, constant: -16),
                separator.heightAnchor.constraint(equalToConstant: 1),
            ])
        }
        
        sizeView.tag = sizes.firstIndex { $0.id == size.id } ?? 0
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapSize))
        sizeView.addGestureRecognizer(tapGestureRecognizer)
        return sizeView
    }
    
    @objc private func didTapSize(_ sender: UITapGestureRecognizer) {
        if let sizeView = sender.view {
            let selected = sizes[sizeView.tag]
            selectedSize = selected
            delegate?.didSelectSize(selected)
            
            updateSelectedSizeView()
        }
    }
    
    private func updateSelectedSizeView() {
        for view in stackView.arrangedSubviews {
            guard
                let outerRadio = view.subviews.first(where: { $0.layer.cornerRadius == 10 }),
                let innerRadio = outerRadio.subviews.first(where: { $0.layer.cornerRadius == 6 }),
                let sizeIndex = sizes.indices.first(where: { sizes[$0].id == sizes[view.tag].id }) else { continue }
            
                let isSelected = sizes[sizeIndex].id == selectedSize?.id
            
            // Update colors based on selection
            outerRadio.layer.borderColor = UIColor(hex: isSelected ? Colors.primary : "#DDDDE3").cgColor
            innerRadio.backgroundColor = UIColor(hex: isSelected ? Colors.primary : Colors.background)
            
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
