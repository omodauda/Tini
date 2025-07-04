//
//  CartVC.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import UIKit

class CartVC: UIViewController {
    
    private let orderType: OrderType
    
    private let cartViewModel = CartViewModel.shared
    
    private let ordersViewModel = OrdersViewModel.shared
    
    private var isCouponApplied: Bool = false
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "Cart", showRightIcon: false, rightIcon: nil)
    
    private let deliveryLabel: UILabel = {
        let deliveryLabel = UILabel()
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
    private let cartPickupView = CartPickupView()
    
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
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
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
    
    private let promotionLabel: UILabel = {
        let promotionLabel = UILabel()
        promotionLabel.text = "Promotion"
        promotionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        promotionLabel.textColor = UIColor(hex: Colors.titleText)
        promotionLabel.translatesAutoresizingMaskIntoConstraints = false
        return promotionLabel
    }()
    
    private let promotionValue: UILabel = {
        let promotionValue = UILabel()
        promotionValue.font = .systemFont(ofSize: 14, weight: .bold)
        promotionValue.textColor = UIColor(hex: "#00AB56")
        promotionValue.translatesAutoresizingMaskIntoConstraints = false
        return promotionValue
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
    
    private let couponStatusIcon: UIImageView = {
        let couponStatusIcon = UIImageView()
        couponStatusIcon.translatesAutoresizingMaskIntoConstraints = false
        couponStatusIcon.isHidden = true
        couponStatusIcon.tintColor = UIColor(hex: "#00AB56")
        return couponStatusIcon
    }()
    
    private let rightIcon: UIButton = {
        let rightIcon = UIButton()
        rightIcon.setImage(Images.rightIcon, for: .normal)
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        rightIcon.tintColor = UIColor(hex: Colors.secondary)
        return rightIcon
    }()
    
    private let payBtn = CustomButton(title: "Pay", backgroundColor: UIColor(hex: Colors.primary), image: nil)
    
    init(orderType: OrderType) {
        self.orderType = orderType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureDeliveryDetailView()
        configureRightIcon()
        configurePayBtn()
        updatePrices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureDeliveryDetailView() {
        
        if orderType == .delivery {
            deliveryLabel.text = "Shipping details"
            
            let cartDeliveryView = CartDeliveryView()
            deliveryDetailView.addSubview(cartDeliveryView)
            cartDeliveryView.translatesAutoresizingMaskIntoConstraints = false
            cartDeliveryView.delegate = self
            
            NSLayoutConstraint.activate([
                cartDeliveryView.topAnchor.constraint(equalTo: deliveryDetailView.topAnchor, constant: 16),
                cartDeliveryView.leadingAnchor.constraint(equalTo: deliveryDetailView.leadingAnchor, constant: 16),
                cartDeliveryView.trailingAnchor.constraint(equalTo: deliveryDetailView.trailingAnchor, constant: -16),
                cartDeliveryView.bottomAnchor.constraint(equalTo: deliveryDetailView.bottomAnchor, constant: -16),
            ])
        } else if orderType == .pickup {
            deliveryLabel.text = "Pickup details"
            
            let cartPickupView = CartPickupView()
            deliveryDetailView.addSubview(cartPickupView)
            cartPickupView.translatesAutoresizingMaskIntoConstraints = false
            cartPickupView.delegate = self
            
            NSLayoutConstraint.activate([
                cartPickupView.topAnchor.constraint(equalTo: deliveryDetailView.topAnchor, constant: 16),
                cartPickupView.leadingAnchor.constraint(equalTo: deliveryDetailView.leadingAnchor, constant: 16),
                cartPickupView.trailingAnchor.constraint(equalTo: deliveryDetailView.trailingAnchor, constant: -16),
                cartPickupView.bottomAnchor.constraint(equalTo: deliveryDetailView.bottomAnchor, constant: -16),
            ])
        }
    }
    
    private func configureRightIcon() {
        rightIcon.addTarget(self, action: #selector(didTapApplyCoupon), for: .touchUpInside)
    }
    
    private func configurePayBtn() {
        payBtn.addTarget(self, action: #selector(didTapPayBtn), for: .touchUpInside)
    }
    
    @objc func didTapPayBtn() {
        let status: OrderStatus = .preparing
        let createdAt: Date = Date()
        let storeAddress: String = "13 Han Thuyen, D.1, HCM city"
        let deliveryDate: String? = "10:00, Today"
        let deliveryAddress: String? = orderType == .delivery ? "285 CMT8, HCM city" : nil
        let total: Double = cartViewModel.cartTotal
        let shippingFee: Double = cartViewModel.shippingFee
        let promotion: Double = cartViewModel.couponPrice
        let items: [CartItemModel] = cartViewModel.cartItems
        
        let order = OrderModel(status: status, createdAt: createdAt, type: orderType, storeAddress: storeAddress, deliveryDate: deliveryDate, deliveryAddress: deliveryAddress, total: total, shippingFee: shippingFee, promotion: promotion, items: items)
        
        ordersViewModel.addOrder(order: order)
        cartViewModel.clearCart()
        
        if let tabBarController = self.tabBarController, let viewControllers = tabBarController.viewControllers {
            let orderTabIndex = 2
            tabBarController.selectedIndex = orderTabIndex
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if let navController = viewControllers[0] as? UINavigationController {
                    navController.popToRootViewController(animated: false)
                }
            }
        }
    }
    
    @objc private func didTapApplyCoupon() {
        isCouponApplied ? removeCoupon() : openCouponModal()
    }
    
    private func openCouponModal() {
        let couponVC = ApplyCouponVC()
        couponVC.delegate = self
        couponVC.modalPresentationStyle = .overCurrentContext
        present(couponVC, animated: true)
    }
    
    private func updatePrices() {
        totalPriceValue.text = String(format: "%.2f", cartViewModel.cartPrice)
        shippingFeeValue.text = String(format: "%.2f", cartViewModel.shippingFee)
        promotionValue.text = isCouponApplied ? String(format: "%.2f", cartViewModel.couponPrice) : "0.00"
        let totalPrice = String(format: "%.2f", cartViewModel.cartTotal)
        payBtn.setTitle("Pay \(totalPrice)", for: .normal)
        payBtn.isEnabled = cartViewModel.cartTotal > 0
        rightIcon.isEnabled = cartViewModel.cartTotal > 0
    }
    
    private func applyCoupon(code: String) {
        dismiss(animated: true)
        isCouponApplied = true
        promotionValue.text = "-\(cartViewModel.couponPrice)"
        couponLabel.text = code.uppercased()
        couponStatusIcon.isHidden = false
        couponStatusIcon.image = Images.checkBoxCircle
        rightIcon.setImage(Images.closeIcon, for: .normal)
        
        cartViewModel.applyCoupon()
        updatePrices()
    }
    
    private func removeCoupon() {
        isCouponApplied = false
        couponLabel.text = "Apply coupon"
        couponStatusIcon.isHidden = true
        rightIcon.setImage(Images.rightIcon, for: .normal)
        
        cartViewModel.removeCoupon()
        updatePrices()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.delegate = self
        header.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(deliveryLabel)
        view.addSubview(deliveryDetailView)
        
        view.addSubview(orderDetailsLabel)
        view.addSubview(orderDetailView)
        orderDetailView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        orderDetailView.addSubview(totalPriceLabel)
        orderDetailView.addSubview(totalPriceValue)
        orderDetailView.addSubview(shippingFeeLabel)
        orderDetailView.addSubview(shippingFeeValue)
        orderDetailView.addSubview(promotionLabel)
        orderDetailView.addSubview(promotionValue)
        
        view.addSubview(footer)
        footer.addSubview(couponIcon)
        footer.addSubview(couponLabel)
        footer.addSubview(couponStatusIcon)
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
            
            shippingFeeValue.topAnchor.constraint(equalTo: totalPriceValue.bottomAnchor, constant: 16),
            shippingFeeValue.trailingAnchor.constraint(equalTo: orderDetailView.trailingAnchor, constant: -16),
            
            promotionLabel.topAnchor.constraint(equalTo: shippingFeeLabel.bottomAnchor, constant: 16),
            promotionLabel.leadingAnchor.constraint(equalTo: orderDetailView.leadingAnchor, constant: 16),
            promotionLabel.bottomAnchor.constraint(equalTo: orderDetailView.bottomAnchor, constant: -16),
            
            promotionValue.topAnchor.constraint(equalTo: shippingFeeValue.bottomAnchor, constant: 16),
            promotionValue.trailingAnchor.constraint(equalTo: orderDetailView.trailingAnchor, constant: -16),
            promotionValue.bottomAnchor.constraint(equalTo: orderDetailView.bottomAnchor, constant: -16),
            
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            couponIcon.topAnchor.constraint(equalTo: footer.topAnchor, constant: 12),
            couponIcon.leadingAnchor.constraint(equalTo: footer.leadingAnchor, constant: 16),
            couponIcon.widthAnchor.constraint(equalToConstant: 20),
            couponIcon.heightAnchor.constraint(equalToConstant: 16),
            
            couponLabel.centerYAnchor.constraint(equalTo: couponIcon.centerYAnchor),
            couponLabel.leadingAnchor.constraint(equalTo: couponIcon.trailingAnchor, constant: 10),
            
            couponStatusIcon.centerYAnchor.constraint(equalTo: couponLabel.centerYAnchor),
            couponStatusIcon.leadingAnchor.constraint(equalTo: couponLabel.trailingAnchor, constant: 6),
            couponStatusIcon.widthAnchor.constraint(equalToConstant: 13),
            couponStatusIcon.heightAnchor.constraint(equalToConstant: 13),
            
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

extension CartVC: CartDeliveryViewDelegate, CartPickupViewDelegate {
    func didTapTime() {
        print("select time")
        let timeVC = PickupTimeVC()
        timeVC.modalPresentationStyle = .overCurrentContext
        present(timeVC, animated: true)
    }
    
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
            if cartViewModel.cartItems[indexPath.row].quantity == 1 {
                let vc = DeleteCartItemVC(at: indexPath.row)
                vc.delegate = self
                vc.modalPresentationStyle = .overCurrentContext
                present(vc, animated: true)
            } else {
                cartViewModel.decreaseQty(for: indexPath.row)
                tableView.reloadData()
                updatePrices()
            }
        }
    }
}

extension CartVC: ApplyCouponVCDelegate {
    func didApplyCoupon(_ code: String) {
        applyCoupon(code: code)
    }
}

extension CartVC: DeleteCartItemVCDelegate {
    func didTapDeleteCartItem(index: Int) {
        cartViewModel.deleteCartItem(at: index)
        tableView.reloadData()
        updatePrices()
        dismiss(animated: true)
    }
}
