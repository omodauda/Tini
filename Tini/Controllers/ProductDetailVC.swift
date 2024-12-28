//
//  ProductDetailVC.swift
//  Tini
//
//  Created by Omodauda on 26/12/2024.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    private let product: Product
    
    private let headerWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let header: UIView = {
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private let backIconWrapper: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let backIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Images.backIcon
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    private let footerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    private let decreaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let quantityWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        return view
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: Colors.titleText)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let increaseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let addToCartBtn = CustomButton(title: "Add to Cart", backgroundColor: UIColor(hex: Colors.primary), image: nil)
    
    private let actionButtonsView = ActionButtonsView()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: Colors.background)
        return view
    }()
    
    private lazy var productCard: ProductCard = {
        let card = ProductCard(product: product)
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureBackButton() {
        backIconWrapper.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.addSubview(backIconWrapper)
        header.addSubview(actionButtonsView)
        backIconWrapper.addSubview(backIcon)
        
        actionButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(footerView)
        footerView.addSubview(quantityWrapper)
        quantityWrapper.addSubview(quantityLabel)
        footerView.addSubview(decreaseButton)
        footerView.addSubview(increaseButton)
        footerView.addSubview(addToCartBtn)
        
        addToCartBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(productCard)
        productCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerWrapper.heightAnchor.constraint(equalToConstant: 120),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            backIconWrapper.topAnchor.constraint(equalTo: header.topAnchor, constant: 12),
            backIconWrapper.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            backIconWrapper.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -12),
            backIconWrapper.widthAnchor.constraint(equalToConstant: 32),
            backIconWrapper.heightAnchor.constraint(equalToConstant: 32),
            
            backIcon.centerXAnchor.constraint(equalTo: backIconWrapper.centerXAnchor),
            backIcon.centerYAnchor.constraint(equalTo: backIconWrapper.centerYAnchor),
            backIcon.widthAnchor.constraint(equalToConstant: 20),
            backIcon.heightAnchor.constraint(equalToConstant: 20),
            
            actionButtonsView.topAnchor.constraint(equalTo: header.topAnchor, constant: 16),
            actionButtonsView.widthAnchor.constraint(equalToConstant: 64),
            actionButtonsView.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
            actionButtonsView.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: footerView.topAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            productCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            productCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            quantityWrapper.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 8),
            quantityWrapper.widthAnchor.constraint(equalToConstant: 40),
            quantityWrapper.heightAnchor.constraint(equalToConstant: 40),
            quantityWrapper.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            
            quantityLabel.centerXAnchor.constraint(equalTo: quantityWrapper.centerXAnchor),
            quantityLabel.centerYAnchor.constraint(equalTo: quantityWrapper.centerYAnchor),
            
            decreaseButton.centerYAnchor.constraint(equalTo: quantityWrapper.centerYAnchor),
            decreaseButton.trailingAnchor.constraint(equalTo: quantityWrapper.leadingAnchor, constant: -4),
            decreaseButton.widthAnchor.constraint(equalToConstant: 40),
            decreaseButton.heightAnchor.constraint(equalToConstant: 40),
            
            increaseButton.centerYAnchor.constraint(equalTo: quantityWrapper.centerYAnchor),
            increaseButton.leadingAnchor.constraint(equalTo: quantityWrapper.trailingAnchor, constant: 4),
            increaseButton.widthAnchor.constraint(equalToConstant: 40),
            increaseButton.heightAnchor.constraint(equalToConstant: 40),
            
            addToCartBtn.topAnchor.constraint(equalTo: quantityWrapper.bottomAnchor, constant: 12),
            addToCartBtn.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            addToCartBtn.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16),
            addToCartBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
        ])
    }
}
