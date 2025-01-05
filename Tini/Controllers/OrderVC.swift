//
//  OrderVC.swift
//  Tini
//
//  Created by Omodauda on 29/11/2024.
//

import UIKit

class OrderVC: UIViewController {
    
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
    
    private let header = TabHeader(title: "Orders")
    
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Store pickup", "Delivery"])
        control.selectedSegmentIndex = 0
        control.backgroundColor = .white
        control.selectedSegmentTintColor = UIColor(hex: Colors.primary)
        
        // Remove the gray background for unselected segments
        let clearImage = UIImage(color: .clear)
        control.setBackgroundImage(clearImage, for: .normal, barMetrics: .default)
        control.setBackgroundImage(clearImage, for: .selected, barMetrics: .default)
        control.setBackgroundImage(clearImage, for: .highlighted, barMetrics: .default)
        
        // Remove divider
        let dividerImage = UIImage(color: UIColor.white)
        control.setDividerImage(dividerImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        // Set text attributes
        control.setTitleTextAttributes([.foregroundColor: UIColor(hex: Colors.secondary), .font: UIFont.systemFont(ofSize: 14, weight: .regular)], for: .normal)
        control.setTitleTextAttributes([.foregroundColor: UIColor(hex: Colors.primary), .font: UIFont.systemFont(ofSize: 14, weight: .bold)], for: .selected)
        
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private let indicatorView = UIView()
    private var indicatorLeadingConstraint: NSLayoutConstraint?
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let storePickupOrders = StorePickupOrdersVC()
    private let deliveryOrders = DeliveryOrdersVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureSegementedControl()
        setSegmentIndicator()
        switchToVC(storePickupOrders)
    }
    
    private func setSegmentIndicator() {
        headerWrapper.addSubview(indicatorView)
        indicatorView.backgroundColor = UIColor(hex: Colors.primary)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let indicatorWidth: CGFloat = view.bounds.size.width / CGFloat(segmentedControl.numberOfSegments)
        
        indicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor)
        NSLayoutConstraint.activate([
            indicatorView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            indicatorLeadingConstraint!,
            indicatorView.widthAnchor.constraint(equalToConstant: indicatorWidth),
            indicatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func updateActiveSegmentIndicator() {
        let activeSegmentIndex = segmentedControl.selectedSegmentIndex
        
        let indicatorWidth: CGFloat = view.bounds.size.width / CGFloat(segmentedControl.numberOfSegments)
        let newLeading = CGFloat(activeSegmentIndex) * indicatorWidth
        
        indicatorLeadingConstraint?.constant = newLeading
        
        UIView.animate(withDuration: 0.3) {
            self.headerWrapper.layoutIfNeeded()
        }
    }
    
    private func configureSegementedControl() {
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    @objc private func segmentChanged() {
        updateActiveSegmentIndicator()
        if segmentedControl.selectedSegmentIndex == 0 {
            switchToVC(storePickupOrders)
        } else {
            switchToVC(deliveryOrders)
        }
    }
    
    private func switchToVC(_ viewController: UIViewController) {
        for child in children {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        
        addChild(viewController)
        contentView.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        viewController.didMove(toParent: self)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(headerWrapper)
        headerWrapper.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            headerWrapper.topAnchor.constraint(equalTo: view.topAnchor),
            headerWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: header.bottomAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: headerWrapper.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: headerWrapper.trailingAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: headerWrapper.bottomAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: 45),
            
            contentView.topAnchor.constraint(equalTo: headerWrapper.bottomAnchor, constant: 1),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
