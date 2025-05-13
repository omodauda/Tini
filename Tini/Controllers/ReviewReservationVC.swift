//
//  ReviewReservationVC.swift
//  Tini
//
//  Created by Omodauda on 12/05/2025.
//

import UIKit

class ReviewReservationVC: UIViewController {
    
    var timer: Timer?
    var remainingSeconds: Int = 300
    
    var date: Date
    var time: String
    var numberOfGuests: Int
    
    private let reservationsViewModel = ReservationsViewModel.shared
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "Review information", showRightIcon: false, rightIcon: nil)
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: -16)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.delaysContentTouches = false
        scrollView.canCancelContentTouches = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    private lazy var tableInfo: ReviewTableInfoView = {
        let tableInfo = ReviewTableInfoView(date: date, time: time, numberOfGuests: numberOfGuests)
        tableInfo.translatesAutoresizingMaskIntoConstraints = false
        return tableInfo
    }()
    
    private let footer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    private let footerBtn = CustomButton(title: "Book table", backgroundColor: UIColor(hex: Colors.primary), image: nil)
    
    private let contactInfoView = ContactInfoView()
    
    private let notesView = NoteView()
    
    init(date: Date, time: String, numberOfGuests: Int) {
        self.date = date
        self.time = time
        self.numberOfGuests = numberOfGuests
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startCountdown()
        createDismissKeyboardTapGesture()
        configureFooterBtn()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    private func createDismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    
    private func startCountdown() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateCountdown() {
        if remainingSeconds > 0 {
            remainingSeconds -= 1
            
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.minute, .second]
            formatter.unitsStyle = .positional
            formatter.zeroFormattingBehavior = .pad
            
            let timestamp = formatter.string(from: TimeInterval(remainingSeconds)) ?? "00:00"
            tableInfo.updateTimer(with: timestamp)
            footerBtn.updateTitle("Book table (\(timestamp))")
        } else {
            stopTimer()
            let vc = TimeoutDialogVC()
            vc.onReselectTable = { [weak self] in
                self?.navigationController?.popViewController(animated: false)
            }
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: false)
        }
    }
    
    private func configureFooterBtn() {
        footerBtn.addTarget(self, action: #selector(bookTable), for: .touchUpInside)
    }
    
    @objc private func bookTable() {
        validateForm()
    }
    
    private func validateForm() {
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
        
        // Name: Must be at least two words
            validate(contactInfoView.nameField, {
                guard let text = self.contactInfoView.nameField.input.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return false }
                let nameParts = text.split(separator: " ")
                return nameParts.count >= 2 && nameParts.allSatisfy { !$0.isEmpty }
            }, "Please enter your full name")

            // Email: Must be a valid email format
            validate(contactInfoView.emailField, {
                guard let email = self.contactInfoView.emailField.input.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return false }
                let emailRegex = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#
                let predicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
                return predicate.evaluate(with: email)
            }, "Enter a valid email address")

            // Phone: Must be 11-digit number
            validate(contactInfoView.phoneField, {
                guard let text = self.contactInfoView.phoneField.input.text else { return false }
                return text.count == 11 && text.allSatisfy({ $0.isNumber })
            }, "Enter a valid 11-digit phone number")
        
        if isValid {
            let newReservation: TableReservationModel = TableReservationModel(id: UUID(), status: .reserved, storeAddress: "Domino's Pizza Abule Egba", numberOfPeople: numberOfGuests, date: date, time: time, fullName: contactInfoView.fullName, email: contactInfoView.email, phoneNumber: contactInfoView.phoneNumber, numberOfEderly: notesView.numberOfEderly, numberOfChildren: notesView.numberOfChildren, sittingArea: notesView.sittingAreaView.selectedOption ?? "Any", notes: notesView.detailNoteView.detailNote)
            
            reservationsViewModel.reserveTable(reservation: newReservation)
            let myReservationsVC = MyReservationsVC()
            // Replace the entire stack with HomeVC and MyReservationsVC
            if let navController = navigationController,
               let homeVC = navController.viewControllers.first {
                navController.setViewControllers([homeVC, myReservationsVC], animated: true)
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(tableInfo)
        tableInfo.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(contactInfoView)
        contactInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(notesView)
        notesView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(footer)
        view.addSubview(footerBtn)
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerWrapper.heightAnchor.constraint(equalToConstant: 120),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            footerBtn.topAnchor.constraint(equalTo: footer.topAnchor, constant: 8),
            footerBtn.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 16),
            footerBtn.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -16),
            footerBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            scrollView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: footer.topAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            
            tableInfo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            tableInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            contactInfoView.topAnchor.constraint(equalTo: tableInfo.bottomAnchor, constant: 16),
            contactInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contactInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            notesView.topAnchor.constraint(equalTo: contactInfoView.bottomAnchor, constant: 16),
            notesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            notesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            notesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension ReviewReservationVC: CustomNavHeaderDelegate {
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func didTapSearch() {
        
    }
}
