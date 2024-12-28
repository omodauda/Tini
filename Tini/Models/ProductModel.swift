//
//  ProductModel.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

struct Product {
    let id: String
    let name: String
    let description: String
    let basePrice: Double
    let image: UIImage
    let sizes: [ProductSize]
    let toppings: [ProductTopping]?
    let maxToppings: Int?
    let isAvailable: Bool
    let isFavorite: Bool
}

struct ProductSize {
    let id: String
    let name: String
    let priceModifier: Double
}

struct ProductTopping {
    let id: String
    let name: String
    let price: Double
}

struct ProductGroup {
    let title: String
    let products: [Product]
}
