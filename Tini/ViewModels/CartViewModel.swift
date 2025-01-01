//
//  CartViewModel.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import Foundation

class CartViewModel {
    
    var cartItems: [CartItemModel] = [
        .init(productImage: Images.Products.capuccino!, productName: "Capuccino", size: "Small", amount: 69.00, quantity: 1, addOns: nil),
        .init(productImage: Images.Products.smokyBurger!, productName: "Smoky burger", size: "Small", amount: 250.00, quantity: 1, addOns: ["Double-patty", "Emmento"]),
    ]
}
