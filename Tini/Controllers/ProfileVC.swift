//
//  ProfileVC.swift
//  Tini
//
//  Created by Omodauda on 29/11/2024.
//

import UIKit

class ProfileVC: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = Images.profileCoverImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = Images.profileAvatarImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let username: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hassanah Taiwo"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()
    
    private let userCardBg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.userCardBg
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let cardGreeting: UILabel = {
       let label = UILabel()
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let name: UILabel = {
       let label = UILabel()
        label.text = "Hassanah Taiwo"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let joinedDate: UILabel = {
        let label = UILabel()
        label.text = "Join date: 20/04/2025"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private let pointsLabel: UILabel = {
       let label = UILabel()
        label.text = "420 Points"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let barcodeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let barcodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.barcode
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let barcode: UILabel = {
        let label = UILabel()
        label.text = "42069-69420-42069"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.textAlignment = .center
        return label
    }()
    
    private let supportView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let supportIconPlaceholder: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.lightPrimary)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headsetIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.headset
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let supportLabel: UILabel = {
       let label = UILabel()
        label.text = "Support"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "#28282B")
        return label
    }()
    
    private let supportText: UILabel = {
       let label = UILabel()
        label.text = "Call or chat with us"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: Colors.secondary)
        return label
    }()
    
    private let rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.rightIcon
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(hex: Colors.secondary)
        return imageView
    }()
    
    private let termText: UILabel = {
        let text = "Terms and Conditions"
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(hex: Colors.primary)
        label.textAlignment = .center
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        label.attributedText = attributedString
        return label
    }()
    
    private let versionText: UILabel = {
        let label = UILabel()
        label.text = "version: 1.0.0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(hex: Colors.secondary)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(headerCoverImageView)
        contentView.addSubview(profileImageView)
        contentView.addSubview(username)
        contentView.addSubview(userCardBg)
        
        userCardBg.addSubview(cardGreeting)
        userCardBg.addSubview(name)
        userCardBg.addSubview(pointsLabel)
        userCardBg.addSubview(joinedDate)
        
        contentView.addSubview(barcodeView)
        barcodeView.addSubview(barcodeImageView)
        barcodeView.addSubview(barcode)
        
        contentView.addSubview(supportView)
        supportView.addSubview(supportIconPlaceholder)
        supportIconPlaceholder.addSubview(headsetIcon)
        supportView.addSubview(rightIcon)
        supportView.addSubview(supportLabel)
        supportView.addSubview(supportText)
        
        contentView.addSubview(termText)
        contentView.addSubview(versionText)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerCoverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerCoverImageView.heightAnchor.constraint(equalToConstant: 125),
            
            profileImageView.topAnchor.constraint(equalTo: headerCoverImageView.bottomAnchor, constant: -25),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 72),
            profileImageView.heightAnchor.constraint(equalToConstant: 72),
            
            username.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            username.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7.5),
            username.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7.5),
            
            userCardBg.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 16),
            userCardBg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userCardBg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userCardBg.heightAnchor.constraint(equalToConstant: 170),
            
            cardGreeting.topAnchor.constraint(equalTo: userCardBg.topAnchor, constant: 24),
            cardGreeting.leadingAnchor.constraint(equalTo: userCardBg.leadingAnchor, constant: 24),
            cardGreeting.trailingAnchor.constraint(equalTo: userCardBg.trailingAnchor, constant: -24),
            
            name.topAnchor.constraint(equalTo: cardGreeting.bottomAnchor),
            name.leadingAnchor.constraint(equalTo: userCardBg.leadingAnchor, constant: 24),
            name.trailingAnchor.constraint(equalTo: userCardBg.trailingAnchor, constant: -24),
            
            pointsLabel.trailingAnchor.constraint(equalTo: userCardBg.trailingAnchor, constant: -39),
            pointsLabel.bottomAnchor.constraint(equalTo: userCardBg.bottomAnchor, constant: -23),
            
            joinedDate.leadingAnchor.constraint(equalTo: userCardBg.leadingAnchor, constant: 24),
            joinedDate.bottomAnchor.constraint(equalTo: userCardBg.bottomAnchor, constant: -27),
            joinedDate.trailingAnchor.constraint(equalTo: pointsLabel.leadingAnchor, constant: -43),
            
            barcodeView.topAnchor.constraint(equalTo: userCardBg.bottomAnchor, constant: 12),
            barcodeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            barcodeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            barcodeImageView.topAnchor.constraint(equalTo: barcodeView.topAnchor, constant: 16),
            barcodeImageView.centerXAnchor.constraint(equalTo: barcodeView.centerXAnchor),
            barcodeImageView.widthAnchor.constraint(equalToConstant: 240),
            barcodeImageView.heightAnchor.constraint(equalToConstant: 55),
            
            barcode.topAnchor.constraint(equalTo: barcodeImageView.bottomAnchor, constant: 8),
            barcode.leadingAnchor.constraint(equalTo: barcodeView.leadingAnchor, constant: 16),
            barcode.trailingAnchor.constraint(equalTo: barcodeView.trailingAnchor, constant: -16),
            barcode.bottomAnchor.constraint(equalTo: barcodeView.bottomAnchor, constant: -16),
            
            supportView.topAnchor.constraint(equalTo: barcodeView.bottomAnchor, constant: 12),
            supportView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            supportView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            supportIconPlaceholder.topAnchor.constraint(equalTo: supportView.topAnchor, constant: 8),
            supportIconPlaceholder.leadingAnchor.constraint(equalTo: supportView.leadingAnchor, constant: 16),
            
            supportIconPlaceholder.bottomAnchor.constraint(equalTo: supportView.bottomAnchor, constant: -11),
            supportIconPlaceholder.widthAnchor.constraint(equalToConstant: 40),
            supportIconPlaceholder.heightAnchor.constraint(equalToConstant: 40),
            
            headsetIcon.centerXAnchor.constraint(equalTo: supportIconPlaceholder.centerXAnchor),
            headsetIcon.centerYAnchor.constraint(equalTo: supportIconPlaceholder.centerYAnchor),
            headsetIcon.widthAnchor.constraint(equalToConstant: 25),
            headsetIcon.heightAnchor.constraint(equalToConstant: 25),
            
            rightIcon.trailingAnchor.constraint(equalTo: supportView.trailingAnchor, constant: -24),
            rightIcon.centerYAnchor.constraint(equalTo: supportView.centerYAnchor),
            rightIcon.widthAnchor.constraint(equalToConstant: 8),
            rightIcon.heightAnchor.constraint(equalToConstant: 14),
            
            supportLabel.topAnchor.constraint(equalTo: supportView.topAnchor, constant: 8),
            supportLabel.leadingAnchor.constraint(equalTo: supportIconPlaceholder.trailingAnchor, constant: 8),
            supportLabel.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16),
            
            supportText.topAnchor.constraint(equalTo: supportLabel.bottomAnchor, constant: 4),
            supportText.leadingAnchor.constraint(equalTo: supportIconPlaceholder.trailingAnchor, constant: 8),
            supportText.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -16),
            supportText.bottomAnchor.constraint(equalTo: supportView.bottomAnchor, constant: -8),
            
            termText.topAnchor.constraint(equalTo: supportView.bottomAnchor, constant: 71),
            termText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            termText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            versionText.topAnchor.constraint(equalTo: termText.bottomAnchor, constant: 16),
            versionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            versionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            versionText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
