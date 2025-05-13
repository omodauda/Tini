//
//  ReservationVC.swift
//  Tini
//
//  Created by Omodauda on 09/05/2025.
//

import UIKit

class ReservationVC: UIViewController {
    
    var numberOfAdults = 1
    var date: Date = Date()
    var timestamp = ""
    
    private let bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = Images.reservationBg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .clear
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "Find table", showRightIcon: false, rightIcon: nil)
    
    private let formView: UIView = {
        let formView = UIView()
        formView.translatesAutoresizingMaskIntoConstraints = false
        formView.backgroundColor = .white
        formView.layer.cornerRadius = 16
        formView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return formView
    }()
    
    private let storeView = TableStoreView()
    
    private let adultPickerView = AdultPickerView()
    private let datePickerView = DatePickerView()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let timePickerView = TimePickerView()
    
    private let reserveButton = CustomButton(title: "Reserve this table", backgroundColor: UIColor.gray, image: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureReserveBtn()
    }
    
    private func updateAdultCount(newValue: Int) {
        numberOfAdults = newValue
        adultPickerView.update(newValue: newValue)
    }
    
    private func updateDate(newDate: Date) {
        date = newDate
        datePickerView.update(newValue: newDate)
    }
    
    private func updateTime(newTime: String) {
        timestamp = newTime
        updateSubmitButtonState()
    }
    
    private func updateSubmitButtonState() {
        let isFormValid = timestamp != ""

        reserveButton.isEnabled = isFormValid
        reserveButton.backgroundColor = isFormValid ? UIColor(hex: Colors.primary) : UIColor.gray
    }
    
    private func configureReserveBtn() {
        reserveButton.addTarget(self, action: #selector(handleReserve), for: .touchUpInside)
    }
    
    @objc private func handleReserve() {
        let vc = ReviewReservationVC(date: date, time: timestamp, numberOfGuests: numberOfAdults)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(bgImage)
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.delegate = self
        header.backgroundColor = .clear
        header.headerTitle.textColor = .white
        header.backIcon.tintColor = .white
        
        view.addSubview(formView)
        formView.addSubview(storeView)
        storeView.translatesAutoresizingMaskIntoConstraints = false
        formView.addSubview(stackView)
        
        adultPickerView.translatesAutoresizingMaskIntoConstraints = false
        adultPickerView.onAdultPickerPressed = { [weak self] in
            let vc = AdultPickerVC(selected: self?.numberOfAdults ?? 1)
            vc.onSelect = { [weak self] num in
                guard let self = self else { return }
                self.updateAdultCount(newValue: num)
            }
            vc.modalPresentationStyle = .overCurrentContext
            self?.present(vc, animated: false)
        }
        
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        datePickerView.update(newValue: date )
        datePickerView.onDatePickerPressed = { [weak self] in
            let vc = DatePickerVC(selected: self?.date ?? Date())
            vc.onSelect = { [weak self] date in
                guard let self = self else { return }
                self.updateDate(newDate: date)
            }
            vc.modalPresentationStyle = .overCurrentContext
            self?.present(vc, animated: false)
        }
        
        stackView.addArrangedSubview(adultPickerView)
        stackView.addArrangedSubview(datePickerView)
        
        formView.addSubview(timePickerView)
        timePickerView.translatesAutoresizingMaskIntoConstraints = false
        timePickerView.onTimeSelected = { [weak self] time in
            self?.updateTime(newTime: time)
        }
        
        formView.addSubview(reserveButton)
        reserveButton.translatesAutoresizingMaskIntoConstraints = false
        reserveButton.isEnabled = false
        
        NSLayoutConstraint.activate([
            bgImage.topAnchor.constraint(equalTo: view.topAnchor),
            bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgImage.heightAnchor.constraint(equalToConstant: 437),
            
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerWrapper.heightAnchor.constraint(equalToConstant: 120),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            formView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            formView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            formView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            formView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            storeView.topAnchor.constraint(equalTo: formView.topAnchor, constant: 16),
            storeView.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 16),
            storeView.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: storeView.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -16),
            
            timePickerView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            timePickerView.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 16),
            timePickerView.trailingAnchor.constraint(equalTo: formView.trailingAnchor),
            timePickerView.heightAnchor.constraint(equalToConstant: 57),
            
            reserveButton.topAnchor.constraint(equalTo: timePickerView.bottomAnchor, constant: 16),
            reserveButton.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 16),
            reserveButton.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -16),
            reserveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }

}

extension ReservationVC: CustomNavHeaderDelegate {
    func didTapBack() {
        navigationController?.popViewController(animated: false)
    }
    
    func didTapSearch() {
        
    }
    
    
}
