//
//  NewAddressVC.swift
//  Tini
//
//  Created by Omodauda on 14/12/2024.
//

import UIKit

class NewAddressVC: UIViewController {
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "New address", showRightIcon: false, rightIcon: nil)
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(hex: Colors.background)
        scrollView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: -16)
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        return contentView
    }()
    
    private let addresslabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "Address"
        return label
    }()
    
    private let addressInput = CustomInput(placeholder: "Enter your address")
    
    private let addressErrorlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "Address is required"
        label.isHidden = true
        return label
    }()
    
    private let cities = ["Akure", "Lagos", "Ibadan"]
    private let cityPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .white
        return picker
    }()
    
    private let citylabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "City"
        return label
    }()
    
    private let cityValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Select city"
        return label
    }()
    
    private let citySelector: UIView = {
        let selector = UIView()
        selector.translatesAutoresizingMaskIntoConstraints = false
        selector.layer.cornerRadius = 4
        selector.layer.borderWidth = 1
        selector.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        return selector
    }()
    
    private let recipientlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "Recipient's name"
        return label
    }()
    
    private let recipientNameInput = CustomInput(placeholder: "E.g Nguyen Van A")
    
    private let recipientNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "Recipient's phone number"
        return label
    }()
    
    private let recipientNumberInput = CustomInput(placeholder: "10-digit phone number")
    
    //    private let addressInput: UITextField = {
    //        let input = UITextField()
    //        input.translatesAutoresizingMaskIntoConstraints = false
    //        input.placeholder = "Enter your address"
    //        input.font = .systemFont(ofSize: 14, weight: .regular)
    //        input.textColor = UIColor(hex: Colors.titleText)
    //        input.layer.borderWidth = 1
    //        input.layer.cornerRadius = 4
    //        input.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
    //        input.textAlignment = .left
    //        input.leftViewMode = .always
    //        return input
    //    }()
    
    private let footerView: UIView = {
        let footer = UIView()
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.backgroundColor = .white
        footer.layer.shadowColor = UIColor.gray.cgColor
        footer.layer.shadowOpacity = 0.2
        footer.layer.shadowOffset = CGSize(width: 0, height: -2)
        footer.layer.shadowRadius = 4
        return footer
    }()
    
    private let saveButton = CustomButton(title: "Save", backgroundColor: UIColor(hex: Colors.primary), image: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCitySelector()
        configurePickerView()
        configureSaveButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureCitySelector() {
        let selectIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = Images.downIcon
            imageView.tintColor = UIColor(hex: Colors.secondary)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        citySelector.addSubview(cityValue)
        citySelector.addSubview(selectIcon)
        
        NSLayoutConstraint.activate([
            selectIcon.trailingAnchor.constraint(equalTo: citySelector.trailingAnchor, constant: -16),
            selectIcon.centerYAnchor.constraint(equalTo: citySelector.centerYAnchor),
            selectIcon.widthAnchor.constraint(equalToConstant: 20),
            selectIcon.heightAnchor.constraint(equalToConstant: 20),
            
            cityValue.topAnchor.constraint(equalTo: citySelector.topAnchor, constant: 9.5),
            cityValue.leadingAnchor.constraint(equalTo: citySelector.leadingAnchor, constant: 16),
            cityValue.trailingAnchor.constraint(equalTo: selectIcon.leadingAnchor, constant: -8),
            cityValue.centerYAnchor.constraint(equalTo: citySelector.centerYAnchor)
        ])
        
        let selectionTap = UITapGestureRecognizer(target: self, action: #selector(citySelectorTapped))
        citySelector.addGestureRecognizer(selectionTap)
        citySelector.isUserInteractionEnabled = true
        
    }
    
    private func configurePickerView() {
            cityPicker.delegate = self
            cityPicker.dataSource = self
        }
    
    @objc private func citySelectorTapped() {
        print("select city pressed")
        let pickerViewController = UIViewController()
        pickerViewController.modalPresentationStyle = .popover
        pickerViewController.preferredContentSize = CGSize(width: view.frame.width, height: 200)
        pickerViewController.view.addSubview(cityPicker)
        
        NSLayoutConstraint.activate([
            cityPicker.leadingAnchor.constraint(equalTo: pickerViewController.view.leadingAnchor),
            cityPicker.trailingAnchor.constraint(equalTo: pickerViewController.view.trailingAnchor),
            cityPicker.topAnchor.constraint(equalTo: pickerViewController.view.topAnchor),
            cityPicker.bottomAnchor.constraint(equalTo: pickerViewController.view.bottomAnchor)
        ])
        
        present(pickerViewController, animated: true)
    }
    
    private func validateForm() -> Bool {
        guard !addressInput.text!.isEmpty else {
            addressErrorlabel.isHidden = false
            return false
        }
        return true
    }
    
    private func configureSaveButton() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped() {
//        print("save")
        print(validateForm())
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(headerWrapper)
        
        headerWrapper.addSubview(header)
        header.delegate = self
        header.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(footerView)
        footerView.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(addresslabel)
        contentView.addSubview(addressInput)
        contentView.addSubview(addressErrorlabel)
        contentView.addSubview(citylabel)
        contentView.addSubview(citySelector)
        contentView.addSubview(recipientlabel)
        contentView.addSubview(recipientNameInput)
        contentView.addSubview(recipientNumberLabel)
        contentView.addSubview(recipientNumberInput)
        
        addressInput.delegate = self
        recipientNameInput.delegate = self
        recipientNumberInput.delegate = self
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerWrapper.heightAnchor.constraint(equalToConstant: 100),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: header.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: footerView.topAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: -48),
            
            addresslabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            addresslabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            addressInput.topAnchor.constraint(equalTo: addresslabel.bottomAnchor, constant: 4),
            addressInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addressInput.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addressInput.heightAnchor.constraint(equalToConstant: 40),
            
            addressErrorlabel.topAnchor.constraint(equalTo: addressInput.bottomAnchor, constant: 4),
            addressErrorlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addressErrorlabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            citylabel.topAnchor.constraint(equalTo: addressErrorlabel.bottomAnchor, constant: 16),
            citylabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            citySelector.topAnchor.constraint(equalTo: citylabel.bottomAnchor, constant: 4),
            citySelector.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            citySelector.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            citySelector.heightAnchor.constraint(equalToConstant: 40),
            
            recipientlabel.topAnchor.constraint(equalTo: citySelector.bottomAnchor, constant: 16),
            recipientlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            recipientlabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            recipientNameInput.topAnchor.constraint(equalTo: recipientlabel.bottomAnchor, constant: 4),
            recipientNameInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            recipientNameInput.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            recipientNameInput.heightAnchor.constraint(equalToConstant: 40),
            
            recipientNumberLabel.topAnchor.constraint(equalTo: recipientNameInput.bottomAnchor, constant: 16),
            recipientNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            recipientNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            recipientNumberInput.topAnchor.constraint(equalTo: recipientNumberLabel.bottomAnchor, constant: 4),
            recipientNumberInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            recipientNumberInput.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            recipientNumberInput.heightAnchor.constraint(equalToConstant: 40),
            
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            saveButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 8),
            saveButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16),
            saveButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -42),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

extension NewAddressVC: CustomNavHeaderDelegate {
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension NewAddressVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
}

extension NewAddressVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = cities[row]
        cityValue.text = selected
        dismiss(animated: true)
    }
}
