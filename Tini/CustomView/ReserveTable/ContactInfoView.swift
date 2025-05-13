//
//  ContactInfoView.swift
//  Tini
//
//  Created by Omodauda on 12/05/2025.
//

import UIKit

class ContactInfoView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "Contact info"
        return label
    }()
    
    private let sectionCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    let nameField = FormField(label: UILabel(), input: CustomInput(placeholder: "Recipient's name"), errorLabel: UILabel())
    let emailField = FormField(label: UILabel(), input: CustomInput(placeholder: "E.g a.nguyen@tiki.vn"), errorLabel: UILabel())
    let phoneField = FormField(label: UILabel(), input: CustomInput(placeholder: "Recipient's phone number"), errorLabel: UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var fullName: String {
        return nameField.input.text ?? ""
    }
    
    var email: String {
        return emailField.input.text ?? ""
    }
    
    var phoneNumber: String {
        return phoneField.input.text ?? ""
    }
    
    private func setupFields() {
        setupField(nameField, label: "Full name")
        nameField.input.delegate = self
        nameField.input.tag = 1
        nameField.input.autocorrectionType = .no
        
        setupField(emailField, label: "Email")
        emailField.input.delegate = self
        emailField.input.tag = 2
        emailField.input.keyboardType = .emailAddress
        emailField.input.autocapitalizationType = .none
        emailField.input.autocorrectionType = .no
        
        setupField(phoneField, label: "11-digit phone number")
        phoneField.input.delegate = self
        phoneField.input.tag = 3
        phoneField.input.keyboardType = .numberPad
        
        let stack = UIStackView(arrangedSubviews: [
            makeFieldStack(nameField),
            makeFieldStack(emailField),
            makeFieldStack(phoneField),
        ])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        sectionCard.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: sectionCard.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: sectionCard.trailingAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: sectionCard.topAnchor, constant: 16),
            stack.bottomAnchor.constraint(equalTo: sectionCard.bottomAnchor, constant: -16)
        ])
    }
    
    func setupField(_ field: FormField, label: String) {
        field.label.text = label
        field.label.font = .systemFont(ofSize: 14, weight: .bold)
        field.label.textColor = UIColor(hex: Colors.titleText)
        
        field.errorLabel.font = .systemFont(ofSize: 12)
        field.errorLabel.textColor = .red
        field.errorLabel.numberOfLines = 0
    }
    
    func makeFieldStack(_ field: FormField) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [field.label, field.input, field.errorLabel])
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(sectionCard)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            sectionCard.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            sectionCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionCard.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

extension ContactInfoView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            nameField.errorLabel.text = ""
        case 2:
            emailField.errorLabel.text = ""
        case 3:
            phoneField.errorLabel.text = ""
        default:
            return
        }
    }
}
