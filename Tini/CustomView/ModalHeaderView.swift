//
//  ModalHeaderView.swift
//  Tini
//
//  Created by Omodauda on 01/01/2025.
//

import UIKit

//protocol ModalHeaderViewDelegate: AnyObject {
//    func didTapDismissButton()
//}

class ModalHeaderView: UIView {
    
    var onDismiss: (() -> Void)?

    private let title: String
    
//    weak var delegate: ModalHeaderViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.closeIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(hex: Colors.titleText)
        return button
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.tetiary)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        
        setupUI()
        configureDismissButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureDismissButton() {
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
    }
    
    @objc private func dismissTapped() {
//        delegate?.didTapDismissButton()
        onDismiss?()
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(dismissButton)
        addSubview(separator)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dismissButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            dismissButton.widthAnchor.constraint(equalToConstant: 14),
            dismissButton.heightAnchor.constraint(equalToConstant: 14),
            
            separator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
