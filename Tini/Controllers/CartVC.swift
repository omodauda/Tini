//
//  CartVC.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import UIKit

class CartVC: UIViewController {
    
    private let cartViewModel = CartViewModel()
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "Cart", showRightIcon: false, rightIcon: nil)
    
    private let deliveryLabel: UILabel = {
        let deliveryLabel = UILabel()
        deliveryLabel.text = "Shipping details"
        deliveryLabel.font = .systemFont(ofSize: 16, weight: .bold)
        deliveryLabel.textColor = UIColor(hex: Colors.titleText)
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        return deliveryLabel
    }()
    
    private let deliveryDetailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let cartDeliveryView = CartDeliveryView()
    
    private let orderDetailsLabel: UILabel = {
        let orderDetailsLabel = UILabel()
        orderDetailsLabel.text = "Order details"
        orderDetailsLabel.font = .systemFont(ofSize: 16, weight: .bold)
        orderDetailsLabel.textColor = UIColor(hex: Colors.titleText)
        orderDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        return orderDetailsLabel
    }()
    
    private let orderDetailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(CartItemCell.self, forCellReuseIdentifier: CartItemCell.identifier)
        tableView.layer.cornerRadius = 8
        return tableView
    }()
    
    private let totalPriceLabel: UILabel = {
        let totalPriceLabel = UILabel()
        totalPriceLabel.text = "Price"
        totalPriceLabel.font = .systemFont(ofSize: 14, weight: .regular)
        totalPriceLabel.textColor = UIColor(hex: "#28282B")
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        return totalPriceLabel
    }()
    
    private lazy var totalPriceValue: UILabel = {
        let totalPriceValue = UILabel()
        totalPriceValue.font = .systemFont(ofSize: 14, weight: .bold)
        totalPriceValue.textColor = UIColor(hex: "#28282B")
        totalPriceValue.translatesAutoresizingMaskIntoConstraints = false
        return totalPriceValue
    }()
    
    private let shippingFeeLabel: UILabel = {
        let shippingFeeLabel = UILabel()
        shippingFeeLabel.text = "Shipping fee"
        shippingFeeLabel.font = .systemFont(ofSize: 14, weight: .regular)
        shippingFeeLabel.textColor = UIColor(hex: "#28282B")
        shippingFeeLabel.translatesAutoresizingMaskIntoConstraints = false
        return shippingFeeLabel
    }()
    
    private lazy var shippingFeeValue: UILabel = {
        let shippingFeeValue = UILabel()
        shippingFeeValue.font = .systemFont(ofSize: 14, weight: .bold)
        shippingFeeValue.textColor = UIColor(hex: "#28282B")
        shippingFeeValue.translatesAutoresizingMaskIntoConstraints = false
        return shippingFeeValue
    }()
    
    private let footer: UIView = {
        let footer = UIView()
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.backgroundColor = .white
        return footer
    }()
    
    private let couponIcon: UIImageView = {
        let couponIcon = UIImageView()
        couponIcon.image = Images.couponIcon
        couponIcon.translatesAutoresizingMaskIntoConstraints = false
        return couponIcon
    }()
    
    private let couponLabel: UILabel = {
        let couponLabel = UILabel()
        couponLabel.text = "Apply coupon"
        couponLabel.font = .systemFont(ofSize: 14, weight: .bold)
        couponLabel.textColor = UIColor(hex: "#28282B")
        couponLabel.translatesAutoresizingMaskIntoConstraints = false
        return couponLabel
    }()
    
    private let rightIcon: UIImageView = {
        let rightIcon = UIImageView()
        rightIcon.image = Images.rightIcon
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        rightIcon.tintColor = UIColor(hex: Colors.secondary)
        return rightIcon
    }()
    
    private let payBtn = CustomButton(title: "Pay", backgroundColor: UIColor(hex: Colors.primary), image: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updatePrices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func updatePrices() {
        totalPriceValue.text = String(format: "%.2f", cartViewModel.cartTotal)
        shippingFeeValue.text = String(format: "%.2f", cartViewModel.shippingFee)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.delegate = self
        header.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(deliveryLabel)
        view.addSubview(deliveryDetailView)
        deliveryDetailView.addSubview(cartDeliveryView)
        cartDeliveryView.translatesAutoresizingMaskIntoConstraints = false
        cartDeliveryView.delegate = self
        
        view.addSubview(orderDetailsLabel)
        view.addSubview(orderDetailView)
        orderDetailView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        orderDetailView.addSubview(totalPriceLabel)
        orderDetailView.addSubview(totalPriceValue)
        orderDetailView.addSubview(shippingFeeLabel)
        orderDetailView.addSubview(shippingFeeValue)
        
        view.addSubview(footer)
        footer.addSubview(couponIcon)
        footer.addSubview(couponLabel)
        footer.addSubview(rightIcon)
        footer.addSubview(payBtn)
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerWrapper.heightAnchor.constraint(equalToConstant: 120),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            deliveryLabel.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor, constant: 16),
            deliveryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            deliveryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            deliveryDetailView.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 8),
            deliveryDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            deliveryDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            cartDeliveryView.topAnchor.constraint(equalTo: deliveryDetailView.topAnchor, constant: 16),
            cartDeliveryView.leadingAnchor.constraint(equalTo: deliveryDetailView.leadingAnchor, constant: 16),
            cartDeliveryView.trailingAnchor.constraint(equalTo: deliveryDetailView.trailingAnchor, constant: -16),
            cartDeliveryView.bottomAnchor.constraint(equalTo: deliveryDetailView.bottomAnchor, constant: -16),
            
            orderDetailsLabel.topAnchor.constraint(equalTo: deliveryDetailView.bottomAnchor, constant: 16),
            orderDetailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            orderDetailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            orderDetailView.topAnchor.constraint(equalTo: orderDetailsLabel.bottomAnchor, constant: 8),
            orderDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            orderDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            orderDetailView.bottomAnchor.constraint(equalTo: footer.topAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: orderDetailView.topAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: orderDetailView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: orderDetailView.trailingAnchor, constant: -16),
            
            totalPriceLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
            totalPriceLabel.leadingAnchor.constraint(equalTo: orderDetailView.leadingAnchor, constant: 16),
            
            totalPriceValue.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
            totalPriceValue.trailingAnchor.constraint(equalTo: orderDetailView.trailingAnchor, constant: -16),
            
            shippingFeeLabel.topAnchor.constraint(equalTo: totalPriceLabel.bottomAnchor, constant: 16),
            shippingFeeLabel.leadingAnchor.constraint(equalTo: orderDetailView.leadingAnchor, constant: 16),
            shippingFeeLabel.bottomAnchor.constraint(equalTo: orderDetailView.bottomAnchor, constant: -16),
            
            shippingFeeValue.topAnchor.constraint(equalTo: totalPriceLabel.bottomAnchor, constant: 16),
            shippingFeeValue.trailingAnchor.constraint(equalTo: orderDetailView.trailingAnchor, constant: -16),
            shippingFeeValue.bottomAnchor.constraint(equalTo: orderDetailView.bottomAnchor, constant: -16),
            
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            couponIcon.topAnchor.constraint(equalTo: footer.topAnchor, constant: 12),
            couponIcon.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 16),
            couponIcon.widthAnchor.constraint(equalToConstant: 20),
            couponIcon.heightAnchor.constraint(equalToConstant: 16),
            
            couponLabel.topAnchor.constraint(equalTo: footer.topAnchor, constant: 9),
            couponLabel.leadingAnchor.constraint(equalTo: couponIcon.trailingAnchor, constant: 10),
            
            rightIcon.topAnchor.constraint(equalTo: footer.topAnchor, constant: 13),
            rightIcon.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -24),
            rightIcon.widthAnchor.constraint(equalToConstant: 12),
            rightIcon.heightAnchor.constraint(equalToConstant: 18),
            
            payBtn.topAnchor.constraint(equalTo: couponIcon.bottomAnchor, constant: 20),
            payBtn.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 16),
            payBtn.trailingAnchor.constraint(equalTo: footer.trailingAnchor, constant: -16),
            payBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}

extension CartVC: CustomNavHeaderDelegate {
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func didTapSearch() {}
}

extension CartVC: CartDeliveryViewDelegate {
    func didTapDeliveryAddress() {
        let vc = AddressListVC()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartViewModel.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCell.identifier, for: indexPath) as? CartItemCell else {
            return UITableViewCell()
        }
        let cartItem = cartViewModel.cartItems[indexPath.row]
        cell.configure(with: cartItem)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
}

extension CartVC: CartItemCellDelegate {
    func didTapIncreaseQty(_ cell: CartItemCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            cartViewModel.increaseQty(for: indexPath.row)
            tableView.reloadData()
            updatePrices()
        }
    }
    
    func didTapDecreaseQty(_ cell: CartItemCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            cartViewModel.decreaseQty(for: indexPath.row)
            tableView.reloadData()
            updatePrices()
        }
    }
}
