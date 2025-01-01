//
//  CartItem.swift
//  Tini
//
//  Created by Omodauda on 31/12/2024.
//

import UIKit

struct CartItemModel {
    let productImage: UIImage
    let productName: String
    let size: String
    let amount: Double
    var quantity: Int
    let addOns: [String]?
    var totalPrice: Double
}

