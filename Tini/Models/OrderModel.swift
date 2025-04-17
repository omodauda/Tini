//
//  OrderModel.swift
//  Tini
//
//  Created by Omodauda on 16/04/2025.
//

import UIKit

enum OrderStatus: String {
    case received
    case preparing
    case readyForPickup
    case delivering
    case delivered
    case failed
    case completed
}

enum OrderType: String {
    case pickup
    case delivery
}

struct OrderModel {
    let status: OrderStatus
    let createdAt: String
    let type: OrderType
    let storeAddress: String
    let deliveryDate: String?
    let deliveryAddress: String?
    let total: Double
    let shippingFee: Double
    let promotion: Double
    let items: [CartItemModel]
}
