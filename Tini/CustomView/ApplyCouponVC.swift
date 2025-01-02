//
//  ApplyCouponVC.swift
//  Tini
//
//  Created by Omodauda on 02/01/2025.
//

import UIKit

class ApplyCouponVC: UIViewController {
    
    private let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let modalHeader = ModalHeaderView(title: "Apply coupon")
    
    private let couponTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your code"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        textField.layer.borderColor = UIColor(hex: Colors.secondary).cgColor
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .placeholderText
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 40))
        textField.textAlignment = .left
        textField.leftViewMode = .always
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupRightView()
    }
    
    private func setupRightView() {
        let rightView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let divider: UIView = {
            let divider = UIView()
            divider.translatesAutoresizingMaskIntoConstraints = false
            divider.backgroundColor = UIColor.black
            divider.widthAnchor.constraint(equalToConstant: 0.35).isActive = true
            divider.heightAnchor.constraint(equalToConstant: 24).isActive = true
            return divider
        }()
        
        let applyBtn: UIButton = {
            let button = UIButton()
            button.setTitle("Apply", for: .normal)
            button.setTitleColor(UIColor(hex: Colors.primary), for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        rightView.addSubview(divider)
        rightView.addSubview(applyBtn)
        
        NSLayoutConstraint.activate([
            rightView.widthAnchor.constraint(equalToConstant: 70),
            rightView.heightAnchor.constraint(equalToConstant: 40),
            
            divider.leadingAnchor.constraint(equalTo: rightView.leadingAnchor),
            divider.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            
            applyBtn.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            applyBtn.leadingAnchor.constraint(equalTo: divider.trailingAnchor, constant: 16),
            applyBtn.trailingAnchor.constraint(equalTo: rightView.trailingAnchor, constant: -16),
        ])
        
        applyBtn.addTarget(self, action: #selector(applyCoupon), for: .touchUpInside)
        couponTextField.rightView = rightView
        couponTextField.rightViewMode = .always
    }
    
    @objc private func applyCoupon() {
        print("apply")
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        view.addSubview(modalView)
        modalView.addSubview(modalHeader)
        modalHeader.translatesAutoresizingMaskIntoConstraints = false
        modalHeader.delegate = self
        
        view.addSubview(couponTextField)
        couponTextField.delegate = self
        
        NSLayoutConstraint.activate([
            modalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            modalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            modalHeader.topAnchor.constraint(equalTo: modalView.topAnchor),
            modalHeader.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
            modalHeader.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
            
            couponTextField.topAnchor.constraint(equalTo: modalHeader.bottomAnchor, constant: 16),
            couponTextField.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            couponTextField.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            couponTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            couponTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}

extension ApplyCouponVC: ModalHeaderViewDelegate {
    func didTapDismissButton() {
        dismiss(animated: true)
    }
}

extension ApplyCouponVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        textField.textColor = .black
    }
}
