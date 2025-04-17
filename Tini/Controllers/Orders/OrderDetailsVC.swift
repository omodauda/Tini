//
//  OrderDetailsVC.swift
//  Tini
//
//  Created by Omodauda on 17/04/2025.
//

import UIKit

class OrderDetailsVC: UIViewController {
    
    private let order: OrderModel
    
    private let headerWrapper: UIView = {
        let headerWrapper = UIView()
        headerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerWrapper.backgroundColor = .white
        headerWrapper.layer.shadowColor = UIColor.gray.cgColor
        headerWrapper.layer.shadowOpacity = 0.2
        headerWrapper.layer.shadowOffset = CGSize(width: 0, height: 3)
        headerWrapper.layer.shadowRadius = 4
        return headerWrapper
    }()
    
    private let header = CustomNavHeader(title: "Order", showRightIcon: true, rightIcon: nil)
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.delaysContentTouches = false
        scrollView.canCancelContentTouches = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let statusImg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let statusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "Preparing"
        return label
    }()
    
    private let contactSupportBtn: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Contact Support"
        configuration.baseBackgroundColor = UIColor(hex: Colors.primary)
        configuration.baseForegroundColor = .white
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 12, bottom: 3, trailing: 12)
        configuration.cornerStyle = .capsule
        
        let btn = UIButton(configuration: configuration)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return btn
    }()
    
    private let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        label.text = "General info"
        return label
    }()
    
    private let orderInfoView = OrderInfoView(orderId: "247-96024", orderDate: "20/04/2025, 04:20")
    
    private let deliveryLabel: UILabel = {
        let deliveryLabel = UILabel()
        deliveryLabel.font = .systemFont(ofSize: 16, weight: .bold)
        deliveryLabel.textColor = UIColor(hex: Colors.titleText)
        deliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        deliveryLabel.text = "Shipping details"
        return deliveryLabel
    }()
    
    private let deliveryDetailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var orderDeliveryView: OrderDeliveryView = {
        return OrderDeliveryView(
            storeAddress: order.storeAddress,
            deliveryAddress: order.deliveryAddress ?? ""
        )
    }()
    
    private lazy var orderPickupView: OrderPickupView = {
        return OrderPickupView(
            pickupDate: order.deliveryDate ?? "", pickupAddress: order.storeAddress
        )
    }()
    
    init(order: OrderModel) {
        self.order = order
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure()
        configureShippingDetailsView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configure() {
        switch order.status {
        case .preparing:
            statusImg.image = Images.Orders.orderPreparing
            statusLabel.text = "Preparing"
        case .received:
            statusImg.image = Images.Orders.orderReceived
            statusLabel.text = "Order received"
        case .readyForPickup:
            statusImg.image = Images.Orders.orderReadyPickup
            statusLabel.text = "Ready for pickup"
        case .delivering:
            statusImg.image = Images.Orders.orderDelivering
            statusLabel.text = "Delivering"
        case .delivered:
            statusImg.image = Images.Orders.orderDelivered
            statusLabel.text = "Delivered"
        case .failed:
            statusImg.image = Images.Orders.orderFailed
            statusLabel.text = "Delivery failed"
        case .completed:
            statusImg.image = Images.Orders.orderCompleted
            statusLabel.text = "Completed"
        }
        
    }
    
    private func configureShippingDetailsView() {
        deliveryDetailView.subviews.forEach { $0.removeFromSuperview()}
        
        switch order.type {
        case .delivery:
            addDetailSubview(orderDeliveryView)
        case .pickup:
            addDetailSubview(orderPickupView)
        }
    }
    
    private func addDetailSubview(_ view: UIView) {
        deliveryDetailView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: deliveryDetailView.topAnchor, constant: 16),
            view.leadingAnchor.constraint(equalTo: deliveryDetailView.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: deliveryDetailView.trailingAnchor, constant: -16),
            view.bottomAnchor.constraint(equalTo: deliveryDetailView.bottomAnchor, constant: -16),
        ])
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(hex: Colors.background)
        
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.delegate = self
        header.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(statusImg)
        contentView.addSubview(statusView)
        statusView.addSubview(statusLabel)
        statusView.addSubview(contactSupportBtn)
        
        contentView.addSubview(infoTitleLabel)
        contentView.addSubview(orderInfoView)
        orderInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(deliveryLabel)
        contentView.addSubview(deliveryDetailView)
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            header.bottomAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            statusImg.topAnchor.constraint(equalTo: contentView.topAnchor),
            statusImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            statusImg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            statusImg.heightAnchor.constraint(equalToConstant: 250),
            
            statusView.topAnchor.constraint(equalTo: statusImg.bottomAnchor, constant: -30),
            statusView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            statusView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            contactSupportBtn.topAnchor.constraint(equalTo: statusView.topAnchor, constant: 16),
            contactSupportBtn.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -16),
            contactSupportBtn.bottomAnchor.constraint(equalTo: statusView.bottomAnchor, constant: -16),
            
            statusLabel.centerYAnchor.constraint(equalTo: contactSupportBtn.centerYAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 16),
            
            infoTitleLabel.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 16),
            infoTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            orderInfoView.topAnchor.constraint(equalTo: infoTitleLabel.bottomAnchor, constant: 8),
            orderInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            orderInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            deliveryLabel.topAnchor.constraint(equalTo: orderInfoView.bottomAnchor, constant: 16),
            deliveryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            deliveryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            deliveryDetailView.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 8),
            deliveryDetailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            deliveryDetailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
}

extension OrderDetailsVC: CustomNavHeaderDelegate {
    func didTapSearch() {
        
    }
    
    func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension OrderDetailsVC: CartPickupViewDelegate {
    func didTapDeliveryAddress() {
        
    }
    
    func didTapTime() {
        
    }
    
    
}
