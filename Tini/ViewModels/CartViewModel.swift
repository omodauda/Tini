//
//  CartViewModel.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import Foundation

class CartViewModel {
    
    var cartItems: [CartItemModel] = [
        .init(productImage: Images.Products.capuccino!, productName: "Capuccino", size: "Small", amount: 69.00, quantity: 1, addOns: nil, totalPrice: 69.00),
        .init(productImage: Images.Products.smokyBurger!, productName: "Smoky burger", size: "Small", amount: 250.00, quantity: 1, addOns: ["Double-patty", "Emmento"], totalPrice: 250.00),
    ]
    
    var cartTotal: Double {
        var total: Double = 0.0
        
        for item in cartItems {
            total += item.totalPrice
        }
        return total
    }
    
    var shippingFee: Double {
        return (5 / 100) * cartTotal
    }
    
    func increaseQty(for index: Int) {
        cartItems[index].quantity += 1
        let itemPrice = cartItems[index].amount
        cartItems[index].totalPrice += itemPrice
    }
    
    func decreaseQty(for index: Int) {
        guard cartItems[index].quantity > 1 else { return }
        cartItems[index].quantity -= 1
        let itemPrice = cartItems[index].amount
        cartItems[index].totalPrice -= itemPrice
    }
}
