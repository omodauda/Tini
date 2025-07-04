//
//  HomeTabController.swift
//  Tini
//
//  Created by Omodauda on 29/11/2024.
//

import UIKit

class HomeTabController: UITabBarController {
    
    private let indicatorView = UIView()
    private var indicatorLeadingConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
        setupTabBarIndicator()
    }
    
    private func configureTabBar() {
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.white
        
        tabBar.tintColor = UIColor(hex: Colors.primary)
        tabBar.unselectedItemTintColor = UIColor(hex: Colors.secondary)
        tabBar.backgroundColor = UIColor.white
        tabBar.layer.shadowColor = UIColor.gray.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -2)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.masksToBounds = false
        tabBar.standardAppearance = appearance
        
        let homeVC = HomeVC()
        homeVC.title = "Home"
        homeVC.tabBarItem.image = Images.Nav.home
        let home = UINavigationController(rootViewController: homeVC)
        
        let storesVC = StoresVC()
        storesVC.title = "Stores"
        storesVC.tabBarItem.image = Images.Nav.store
        let stores = UINavigationController(rootViewController: storesVC)
        
        let orderVC = OrderVC()
        orderVC.title = "Order"
        orderVC.tabBarItem.image = Images.Nav.order
        let order = UINavigationController(rootViewController: orderVC)
        
        
        let profile = ProfileVC()
        profile.title = "Profile"
        profile.tabBarItem.image = Images.Nav.profile
        
        viewControllers = [home, stores, order, profile]
    }
    
    private func setupTabBarIndicator() {
        guard let tabBarItems = tabBar.items else { return }
        
        // Add the indicator view
        tabBar.addSubview(indicatorView)
        indicatorView.backgroundColor = UIColor(hex: Colors.primary)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        // Calculate the width of each tab
        let tabBarItemWidth = tabBar.bounds.width / CGFloat(tabBarItems.count)
        
        // Set up constraints for the indicator
        indicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor)
        NSLayoutConstraint.activate([
            indicatorLeadingConstraint!,
            indicatorView.topAnchor.constraint(equalTo: tabBar.topAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: tabBarItemWidth),
            indicatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let tabBarItems = tabBar.items,
        let index = tabBarItems.firstIndex(of: item) else { return }
        
        let tabBarItemWidth = tabBar.bounds.width / CGFloat(tabBarItems.count)
        let newLeading = CGFloat(index) * tabBarItemWidth
        
        // Update the leading constraint of the indicator
        indicatorLeadingConstraint?.constant = newLeading
        
        // Animate the position change
        UIView.animate(withDuration: 0.3) {
            self.tabBar.layoutIfNeeded()
        }
    }
}
