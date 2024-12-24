//
//  ProductsListViewModel.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

class ProductsListViewModel {
    
    private let allProducts: [Product] = [
        .init(name: "Pure black", price: 59.00, image: Images.Products.pureBlack!, isAvailable: true, isFavorite: true),
        .init(name: "Latte", price: 59.00, image: Images.Products.latte!, isAvailable: true, isFavorite: true),
        .init(name: "Capuccino", price: 69.00, image: Images.Products.capuccino!, isAvailable: true, isFavorite: true),
        .init(name: "Arabica 1kg", price: 69.00, image: Images.Products.arabica!, isAvailable: true, isFavorite: true),
        .init(name: "Hawalian pizza", price: 109.99, image: Images.Products.hawalianPizza!, isAvailable: false, isFavorite: true),
        .init(name: "Smoky burger", price: 96.00, image: Images.Products.smokyBurger!, isAvailable: true, isFavorite: true),
        .init(name: "Robusta 1kg", price: 69.00, image: Images.Products.robusta!, isAvailable: true, isFavorite: true),
        
            .init(name: "Pure black", price: 59.00, image: Images.Products.pureBlack!, isAvailable: true, isFavorite: false),
        .init(name: "Latte", price: 59.00, image: Images.Products.latte!, isAvailable: true, isFavorite: false),
        .init(name: "Capuccino", price: 69.00, image: Images.Products.capuccino!, isAvailable: true, isFavorite: false),
        .init(name: "Arabica 1kg", price: 69.00, image: Images.Products.arabica!, isAvailable: true, isFavorite: false),
        .init(name: "Hawalian pizza", price: 109.99, image: Images.Products.hawalianPizza!, isAvailable: false, isFavorite: false),
        .init(name: "Smoky burger", price: 96.00, image: Images.Products.smokyBurger!, isAvailable: true, isFavorite: false),
        .init(name: "Robusta 1kg", price: 69.00, image: Images.Products.robusta!, isAvailable: true, isFavorite: false),
    ]
    
    var sections: [ProductGroup] = []
    var favoritesList: [Product] = []
    
    func loadSections() {
        let favorites = allProducts.filter { $0.isFavorite }
        let others = allProducts.filter { !$0.isFavorite }
        
        sections = []
        favoritesList = []
        if !favorites.isEmpty {
            sections.append(ProductGroup(title: "Favorite", products: favorites))
            favoritesList = favorites
        }
        if !others.isEmpty {
            sections.append(ProductGroup(title: "Coffee", products: others))
        }
    }
    
    func searchFavorites(with query: String) {
        if query.isEmpty {
            loadSections()
        } else {
            let filteredFavorites = allProducts.filter { $0.isFavorite && $0.name.lowercased().contains(query.lowercased()) }
            
            favoritesList = []
            if !filteredFavorites.isEmpty {
                favoritesList = filteredFavorites
            }
            
        }
    }
}
