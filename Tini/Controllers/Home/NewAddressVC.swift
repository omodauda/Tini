//
//  NewAddressVC.swift
//  Tini
//
//  Created by Omodauda on 14/12/2024.
//

import UIKit

class NewAddressVC: UIViewController {
    
    private let deliveryAddressViewModel = DeliveryAddressViewModel.shared
    
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
    
    let cities = ["Hanoi", "Ho Chi Minh"]
    let districtsByCity: [String: [String]] = [
        "Hanoi": ["Ba Dinh", "Dong Da"],
        "Ho Chi Minh": ["District 1", "District 3"]
    ]
    let wardsByDistrict: [String: [String]] = [
        "Ba Dinh": ["Ward 1", "Ward 2"],
        "Dong Da": ["Ward 3", "Ward 4"],
        "District 1": ["Ward A", "Ward B"],
        "District 3": ["Ward C", "Ward D"]
    ]
    
    var selectedCity: String?
    var selectedDistrict: String?
    var selectedWard: String?
    
    struct FormField {
        let label: UILabel
        let input: UITextField
        let errorLabel: UILabel
    }
    
    let addressField = FormField(
        label: UILabel(),
        input: CustomInput(placeholder: "Lot number, street name"),
        errorLabel: UILabel()
    )
    let cityField = FormField(label: UILabel(), input: CustomInput(placeholder: "Select city"), errorLabel: UILabel())
    let districtField = FormField(label: UILabel(), input: CustomInput(placeholder: "Select district"), errorLabel: UILabel())
    let wardField = FormField(label: UILabel(), input: CustomInput(placeholder: "Select ward"), errorLabel: UILabel())
    let nameField = FormField(label: UILabel(), input: CustomInput(placeholder: "Recipient's name"), errorLabel: UILabel())
    let phoneField = FormField(label: UILabel(), input: CustomInput(placeholder: "Recipient's phone number"), errorLabel: UILabel())
    
    let cityPicker = UIPickerView()
    let districtPicker = UIPickerView()
    let wardPicker = UIPickerView()
    
    let toolbar = UIToolbar()
    
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
        createDismissKeyboardTapGesture()
        setupUI()
        setInputFields()
        setupPickers()
        setupToolbar()
        configureSaveButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func validateForm() {
        var isValid = true
        
        func validate(_ field: FormField, _ customCheck: (() -> Bool)? = nil, _ errorMessage: String) {
            if let check = customCheck {
                if !check() {
                    field.errorLabel.text = errorMessage
                    isValid = false
                } else {
                    field.errorLabel.text = ""
                }
            } else if field.input.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {
                field.errorLabel.text = errorMessage
                isValid = false
            } else {
                field.errorLabel.text = ""
            }
        }
        
        validate(addressField, nil, "Address is required")
        validate(cityField, nil, "City is required")
        validate(districtField, nil, "District is required")
        validate(wardField, nil, "Ward is required")
        validate(nameField, nil, "Name is required")
        
        validate(phoneField, {
            guard let text = self.phoneField.input.text else { return false }
            return text.count == 11 && text.allSatisfy({ $0.isNumber })
        }, "Enter a valid 11-digit phone number")
        
        if isValid {
            let newAddress = DeliveryAddressModel(
                address: addressField.input.text!,
                city: cityField.input.text!,
                district: districtField.input.text!,
                ward: wardField.input.text!,
                recipientName: nameField.input.text!,
                recipientPhoneNumber: phoneField.input.text!)
            deliveryAddressViewModel.addAddress(address: newAddress)
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func configureSaveButton() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped() {
        validateForm()
    }
    
    private func setInputFields() {
        setupField(addressField, label: "Lot number, street name")
        addressField.input.delegate = self
        addressField.input.tag = 3
        
        setupField(cityField, label: "City")
        
        setupField(districtField, label: "District")
        
        setupField(wardField, label: "Ward")
        
        setupField(nameField, label: "Full name (e.g Nguyen Van A)")
        nameField.input.delegate = self
        nameField.input.tag = 4
        
        setupField(phoneField, label: "Phone number")
        phoneField.input.delegate = self
        phoneField.input.tag = 5
        phoneField.input.keyboardType = .numberPad
        
        // Set input views
        cityField.input.inputView = cityPicker
        districtField.input.inputView = districtPicker
        wardField.input.inputView = wardPicker

        
        [cityField, districtField, wardField].forEach {
            $0.input.tintColor = .clear
            $0.input.isUserInteractionEnabled = true
            $0.input.rightViewMode = .always
            $0.input.inputAccessoryView = toolbar
        }
        
        let stack = UIStackView(arrangedSubviews: [
            makeFieldStack(addressField),
            makeFieldStack(cityField),
            makeFieldStack(districtField),
            makeFieldStack(wardField),
            makeFieldStack(nameField),
            makeFieldStack(phoneField),
        ])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
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
    
    func setupPickers() {
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityPicker.tag = 0
        
        districtPicker.delegate = self
        districtPicker.dataSource = self
        districtPicker.tag = 1
        
        wardPicker.delegate = self
        wardPicker.dataSource = self
        wardPicker.tag = 2
    }
    
    func setupToolbar() {
        toolbar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        toolbar.setItems([flexSpace, done], animated: false)
    }
    
    @objc private func doneTapped() {
        view.endEditing(true)
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
    func didTapSearch() {}
    
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension NewAddressVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 3:
            addressField.errorLabel.text = ""
        case 4:
            nameField.errorLabel.text = ""
        case 5:
            phoneField.errorLabel.text = ""
        default:
            return
        }
    }
}

extension NewAddressVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0: return cities.count
        case 1: return districtsByCity[selectedCity ?? ""]?.count ?? 0
        case 2: return wardsByDistrict[selectedDistrict ?? ""]?.count ?? 0
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0: return cities[row]
        case 1: return districtsByCity[selectedCity ?? ""]?[row]
        case 2: return wardsByDistrict[selectedDistrict ?? ""]?[row]
        default: return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            selectedCity = cities[row]
            cityField.input.text = selectedCity
            cityField.errorLabel.text = ""
            selectedDistrict = nil
            selectedWard = nil
            districtField.input.text = ""
            wardField.input.text = ""
            districtPicker.reloadAllComponents()
            wardPicker.reloadAllComponents()
        case 1:
            if let districts = districtsByCity[selectedCity ?? ""] {
                selectedDistrict = districts[row]
                districtField.input.text = selectedDistrict
                districtField.errorLabel.text = ""
                selectedWard = nil
                wardField.input.text = ""
                wardPicker.reloadAllComponents()
            }
        case 2:
            if let wards = wardsByDistrict[selectedDistrict ?? ""] {
                selectedWard = wards[row]
                wardField.input.text = selectedWard
                wardField.errorLabel.text = ""
            }
        default: break
        }
    }
}
