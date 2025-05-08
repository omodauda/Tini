//
//  CartViewModel.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import Foundation

class CartViewModel {
    
    static let shared = CartViewModel()
    
    private init() {}

    var cartItems: [CartItemModel] = []
    var isCouponApplied: Bool = false
    let couponPrice = 20.00
    
    var cartPrice: Double {
        var total: Double = 0.0
        
        for item in cartItems {
            total += item.totalPrice
        }
        return total
    }
    
    var shippingFee: Double {
        return (5 / 100) * cartPrice
    }
    
    var cartTotal: Double {
        return cartPrice + shippingFee - (isCouponApplied ? couponPrice : 0.0)
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
    
    func applyCoupon() {
        isCouponApplied = true
    }
    
    func removeCoupon() {
        isCouponApplied = false
    }
    
    func deleteCartItem(at index: Int) {
        cartItems.remove(at: index)
    }
    
    func addItemToCart(item: CartItemModel) {
        let existingItemIndex = cartItems.firstIndex(where: {$0.productName == item.productName})
        if existingItemIndex != nil {
            increaseQty(for: existingItemIndex!)
        } else {
            cartItems.append(item)
        }
    }
    
    func clearCart() {
        cartItems = []
        isCouponApplied = false
    }
}
