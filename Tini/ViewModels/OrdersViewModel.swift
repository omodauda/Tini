//
//  OrdersViewModel.swift
//  Tini
//
//  Created by Omodauda on 16/04/2025.
//

import Foundation

class OrdersViewModel {
    static let shared = OrdersViewModel()
    
    private init() {}
    
    var orders: [OrderModel] = [
        OrderModel(status: .preparing, createdAt: Calendar.current.date(byAdding: .day, value: 0, to: Date())!, type: .delivery, storeAddress: "13 Han Thuyen, D.1, HCM city", deliveryDate: nil, deliveryAddress: "285 CMT8, D.10, HCM city", total: 284.00, shippingFee: 15.00, promotion: 50.00, items: [
            CartItemModel(productImage: Images.Products.capuccino!, productName: "Capuccino", size: "Small", amount: 69.00, quantity: 1, addOns: nil, totalPrice: 69.00),
            CartItemModel(productImage: Images.Products.smokyBurger!, productName: "Smoky burger", size: nil, amount: 250.00, quantity: 1, addOns: ["Double-patty", "Emmento"], totalPrice: 250.00),
        ]),
        OrderModel(status: .delivering, createdAt: Calendar.current.date(byAdding: .day, value: 0, to: Date())!, type: .delivery, storeAddress: "13 Han Thuyen, D.1, HCM city", deliveryDate: nil, deliveryAddress: "285 CMT8, D.10, HCM city", total: 284.00, shippingFee: 15.00, promotion: 50.00, items: [
            CartItemModel(productImage: Images.Products.capuccino!, productName: "Capuccino", size: "Small", amount: 69.00, quantity: 1, addOns: nil, totalPrice: 69.00),
            CartItemModel(productImage: Images.Products.smokyBurger!, productName: "Smoky burger", size: nil, amount: 250.00, quantity: 1, addOns: ["Double-patty", "Emmento"], totalPrice: 250.00),
        ]),
        OrderModel(status: .delivered, createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, type: .delivery, storeAddress: "13 Han Thuyen, D.1, HCM city", deliveryDate: nil, deliveryAddress: "285 CMT8, D.10, HCM city", total: 284.00, shippingFee: 15.00, promotion: 50.00, items: [
            CartItemModel(productImage: Images.Products.capuccino!, productName: "Capuccino", size: "Small", amount: 69.00, quantity: 1, addOns: nil, totalPrice: 69.00),
            CartItemModel(productImage: Images.Products.smokyBurger!, productName: "Smoky burger", size: nil, amount: 250.00, quantity: 1, addOns: ["Double-patty", "Emmento"], totalPrice: 250.00),
        ]),
        OrderModel(status: .failed, createdAt: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, type: .delivery, storeAddress: "13 Han Thuyen, D.1, HCM city", deliveryDate: nil, deliveryAddress: "285 CMT8, D.10, HCM city", total: 284.00, shippingFee: 15.00, promotion: 50.00, items: [
            CartItemModel(productImage: Images.Products.capuccino!, productName: "Capuccino", size: "Small", amount: 69.00, quantity: 1, addOns: nil, totalPrice: 69.00),
            CartItemModel(productImage: Images.Products.smokyBurger!, productName: "Smoky burger", size: nil, amount: 250.00, quantity: 1, addOns: ["Double-patty", "Emmento"], totalPrice: 250.00),
        ]),
        
        OrderModel(status: .received, createdAt: Calendar.current.date(byAdding: .hour, value: -3, to: Calendar.current.date(byAdding: .day, value: 0, to: Date())!)!, type: .pickup, storeAddress: "13 Han Thuyen, D.1, HCM city", deliveryDate: "10:00, Today", deliveryAddress: nil, total: 284.00, shippingFee: 15.00, promotion: 50.00, items: [
            CartItemModel(productImage: Images.Products.capuccino!, productName: "Capuccino", size: "Small", amount: 69.00, quantity: 1, addOns: nil, totalPrice: 69.00),
            CartItemModel(productImage: Images.Products.smokyBurger!, productName: "Smoky burger", size: nil, amount: 250.00, quantity: 1, addOns: ["Double-patty", "Emmento"], totalPrice: 250.00),
        ]),
        OrderModel(status: .readyForPickup, createdAt: Calendar.current.date(byAdding: .day, value: 0, to: Date())!, type: .pickup, storeAddress: "13 Han Thuyen, D.1, HCM city", deliveryDate: "10:00, Today", deliveryAddress: nil, total: 284.00, shippingFee: 15.00, promotion: 50.00, items: [
            CartItemModel(productImage: Images.Products.capuccino!, productName: "Capuccino", size: "Small", amount: 69.00, quantity: 1, addOns: nil, totalPrice: 69.00),
            CartItemModel(productImage: Images.Products.smokyBurger!, productName: "Smoky burger", size: nil, amount: 250.00, quantity: 1, addOns: ["Double-patty", "Emmento"], totalPrice: 250.00),
        ]),
        OrderModel(status: .completed, createdAt: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, type: .pickup, storeAddress: "13 Han Thuyen, D.1, HCM city", deliveryDate: "10:00, Today", deliveryAddress: nil, total: 284.00, shippingFee: 15.00, promotion: 50.00, items: [
            CartItemModel(productImage: Images.Products.capuccino!, productName: "Capuccino", size: "Small", amount: 69.00, quantity: 1, addOns: nil, totalPrice: 69.00),
            CartItemModel(productImage: Images.Products.smokyBurger!, productName: "Smoky burger", size: nil, amount: 250.00, quantity: 1, addOns: ["Double-patty", "Emmento"], totalPrice: 250.00),
        ]),
    ]
}
