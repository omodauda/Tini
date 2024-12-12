//
//  ProductsListViewModel.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

struct ProductsListViewModel {
    let favorites: [Product] = [
        .init(name: "Pure black", price: 59.00, image: Images.Products.pureBlack!, isAvailable: true),
        .init(name: "Latte", price: 59.00, image: Images.Products.latte!, isAvailable: true),
        .init(name: "Capuccino", price: 69.00, image: Images.Products.capuccino!, isAvailable: true),
        .init(name: "Arabica 1kg", price: 69.00, image: Images.Products.arabica!, isAvailable: true),
        .init(name: "Hawalian pizza", price: 109.99, image: Images.Products.hawalianPizza!, isAvailable: false),
        .init(name: "Smoky burger", price: 96.00, image: Images.Products.smokyBurger!, isAvailable: true),
        .init(name: "Robusta 1kg", price: 69.00, image: Images.Products.robusta!, isAvailable: true),
    ]
    
    let coffee: [Product] = [
        .init(name: "Pure black", price: 59.00, image: Images.Products.pureBlack!, isAvailable: true),
        .init(name: "Latte", price: 59.00, image: Images.Products.latte!, isAvailable: true),
        .init(name: "Capuccino", price: 69.00, image: Images.Products.capuccino!, isAvailable: true),
        .init(name: "Arabica 1kg", price: 69.00, image: Images.Products.arabica!, isAvailable: true),
        .init(name: "Hawalian pizza", price: 109.99, image: Images.Products.hawalianPizza!, isAvailable: false),
        .init(name: "Smoky burger", price: 96.00, image: Images.Products.smokyBurger!, isAvailable: true),
        .init(name: "Robusta 1kg", price: 69.00, image: Images.Products.robusta!, isAvailable: true),
    ]
    
    lazy var productsList: [ProductGroup] = [
        .init(title: "Favorite", products: favorites),
        .init(title: "Coffee", products: coffee)
    ]
}
