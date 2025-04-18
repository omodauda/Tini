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
        scrollView.bounces = false
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
    
    private let noteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#DDDDE3").cgColor
        return view
    }()
    
    private let noteIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "info.circle"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(hex: Colors.secondary)
        return imageView
    }()
    
    
    private let noteLabel: UILabel = {
        let fullText = "Order will be automatically completed X hours after pick up time. The store won't be responsible for your order after that time."
        let boldText = "X hours"
        let attributedText = NSMutableAttributedString(string: fullText)
        let fullRange = NSString(string: fullText).range(of: boldText)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: fullRange)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.titleText)
        label.numberOfLines = 0
        
        label.attributedText = attributedText
        return label
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
    
    private let paymentInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Payment info"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.titleText)
        return label
    }()
    
    private let paymentInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        return view
    }()
    
    private let paymentLogo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.image = Images.momo
        return logo
    }()
    
    private let paymentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Payment method"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "#28282B")
        return label
    }()
    
    private let paymentMethod: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Momo"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: "#28282B")
        return label
    }()
    
    private let pricingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        return view
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "#28282B")
        return label
    }()
    
    private let priceValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.00"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: "#28282B")
        return label
    }()
    
    private let promotionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Promotion"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "#28282B")
        return label
    }()
    
    private let promotionValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-0.00"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: Colors.green)
        return label
    }()
    
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: "#28282B")
        return label
    }()
    
    private let totalValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.00"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(hex: "#28282B")
        return label
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
        configureContactSupportBtn()
        addNoteView()
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
        priceValue.text = "\(order.total)"
        promotionValue.text = "-\(order.promotion)"
        totalValue.text = "\(order.total - order.promotion)"
        
    }
    
    private func configureContactSupportBtn() {
        contactSupportBtn.addTarget(self, action: #selector(contactSupport), for: .touchUpInside)
    }
    
    @objc func contactSupport() {
        let vc = ContactSupportVC()
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    private func addNoteView() {
        guard order.status == .readyForPickup || order.status == .completed else {
           return NSLayoutConstraint.activate([
            contactSupportBtn.bottomAnchor.constraint(equalTo: statusView.bottomAnchor, constant: -16),
           ])
        }
        
        statusView.addSubview(noteView)
        noteView.addSubview(noteIcon)
        noteView.addSubview(noteLabel)
        
        NSLayoutConstraint.activate([
            noteView.topAnchor.constraint(equalTo: contactSupportBtn.bottomAnchor, constant: 18),
            noteView.leadingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 16),
            noteView.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -16),
            noteView.bottomAnchor.constraint(equalTo: statusView.bottomAnchor, constant: -8),
            
            noteIcon.topAnchor.constraint(equalTo: noteView.topAnchor, constant: 10),
            noteIcon.leadingAnchor.constraint(equalTo: noteView.leadingAnchor, constant: 10),
            noteIcon.widthAnchor.constraint(equalToConstant: 20),
            noteIcon.heightAnchor.constraint(equalToConstant: 20),
            
            noteLabel.topAnchor.constraint(equalTo: noteView.topAnchor, constant: 10),
            noteLabel.leadingAnchor.constraint(equalTo: noteIcon.trailingAnchor, constant: 10),
            noteLabel.trailingAnchor.constraint(equalTo: noteView.trailingAnchor, constant: -10),
            noteLabel.bottomAnchor.constraint(equalTo: noteView.bottomAnchor, constant: -10)
        ])
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
        
        contentView.addSubview(paymentInfoLabel)
        contentView.addSubview(paymentInfoView)
        paymentInfoView.addSubview(paymentLogo)
        paymentInfoView.addSubview(paymentLabel)
        paymentInfoView.addSubview(paymentMethod)
        
        contentView.addSubview(pricingView)
        pricingView.addSubview(priceLabel)
        pricingView.addSubview(priceValue)
        pricingView.addSubview(promotionLabel)
        pricingView.addSubview(promotionValue)
        pricingView.addSubview(totalLabel)
        pricingView.addSubview(totalValue)
        
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
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
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
            
            paymentInfoLabel.topAnchor.constraint(equalTo: deliveryDetailView.bottomAnchor, constant: 16),
            paymentInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            paymentInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            paymentInfoView.topAnchor.constraint(equalTo: paymentInfoLabel.bottomAnchor, constant: 8),
            paymentInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            paymentInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            paymentLogo.topAnchor.constraint(equalTo: paymentInfoView.topAnchor, constant: 16),
            paymentLogo.leadingAnchor.constraint(equalTo: paymentInfoView.leadingAnchor, constant: 16),
            paymentLogo.widthAnchor.constraint(equalToConstant: 40),
            paymentLogo.heightAnchor.constraint(equalToConstant: 40),
            
            paymentLabel.topAnchor.constraint(equalTo: paymentInfoView.topAnchor, constant: 16),
            paymentLabel.leadingAnchor.constraint(equalTo: paymentLogo.trailingAnchor, constant: 8),
            paymentLabel.trailingAnchor.constraint(equalTo: paymentInfoView.trailingAnchor, constant: -16),
            
            paymentMethod.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 4),
            paymentMethod.leadingAnchor.constraint(equalTo: paymentLogo.trailingAnchor, constant: 8),
            paymentMethod.trailingAnchor.constraint(equalTo: paymentInfoView.trailingAnchor, constant: -16),
            paymentMethod.bottomAnchor.constraint(equalTo: paymentInfoView.bottomAnchor, constant: -16),
            
            pricingView.topAnchor.constraint(equalTo: paymentInfoView.bottomAnchor, constant: 16),
            pricingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pricingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            pricingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            priceLabel.topAnchor.constraint(equalTo: pricingView.topAnchor, constant: 24),
            priceLabel.leadingAnchor.constraint(equalTo: pricingView.leadingAnchor, constant: 16),
            
            priceValue.topAnchor.constraint(equalTo: pricingView.topAnchor, constant: 24),
            priceValue.trailingAnchor.constraint(equalTo: pricingView.trailingAnchor, constant: -16),
            
            promotionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16),
            promotionLabel.leadingAnchor.constraint(equalTo: pricingView.leadingAnchor, constant: 16),
            
            promotionValue.topAnchor.constraint(equalTo: priceValue.bottomAnchor, constant: 16),
            promotionValue.trailingAnchor.constraint(equalTo: pricingView.trailingAnchor, constant: -16),
            
            totalLabel.topAnchor.constraint(equalTo: promotionLabel.bottomAnchor, constant: 16),
            totalLabel.leadingAnchor.constraint(equalTo: pricingView.leadingAnchor, constant: 16),
            totalLabel.bottomAnchor.constraint(equalTo: pricingView.bottomAnchor, constant: -24),
            
            totalValue.topAnchor.constraint(equalTo: promotionValue.bottomAnchor, constant: 16),
            totalValue.trailingAnchor.constraint(equalTo: pricingView.trailingAnchor, constant: -16),
            totalValue.bottomAnchor.constraint(equalTo: pricingView.bottomAnchor, constant: -24)
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

extension OrderDetailsVC: ContactSupportDelegate {
    func close() {
        dismiss(animated: true)
    }
}
