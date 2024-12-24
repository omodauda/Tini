//
//  ProductModel.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

struct Product {
    let name: String
    let price: Double
    let image: UIImage
    let isAvailable: Bool
    let isFavorite: Bool
}

struct ProductGroup {
    let title: String
    let products: [Product]
}
