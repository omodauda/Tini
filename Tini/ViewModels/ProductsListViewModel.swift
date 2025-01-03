//
//  ProductsListViewModel.swift
//  Tini
//
//  Created by Omodauda on 12/12/2024.
//

import UIKit

class ProductsListViewModel {
    
    static let shared = ProductsListViewModel()
    
    private init() {}
    
//    private let allProducts: [Product] = [
//        .init(id: "1", name: "Pure black", price: 59.00, image: Images.Products.pureBlack!, isAvailable: true, isFavorite: true),
//        .init(name: "Latte", price: 59.00, image: Images.Products.latte!, isAvailable: true, isFavorite: true),
//        .init(name: "Capuccino", price: 69.00, image: Images.Products.capuccino!, isAvailable: true, isFavorite: true),
//        .init(name: "Arabica 1kg", price: 69.00, image: Images.Products.arabica!, isAvailable: true, isFavorite: true),
//        .init(name: "Hawalian pizza", price: 109.99, image: Images.Products.hawalianPizza!, isAvailable: false, isFavorite: true),
//        .init(name: "Smoky burger", price: 96.00, image: Images.Products.smokyBurger!, isAvailable: true, isFavorite: true),
//        .init(name: "Robusta 1kg", price: 69.00, image: Images.Products.robusta!, isAvailable: true, isFavorite: true),
//        
//            .init(name: "Pure black", price: 59.00, image: Images.Products.pureBlack!, isAvailable: true, isFavorite: false),
//        .init(name: "Latte", price: 59.00, image: Images.Products.latte!, isAvailable: true, isFavorite: false),
//        .init(name: "Capuccino", price: 69.00, image: Images.Products.capuccino!, isAvailable: true, isFavorite: false),
//        .init(name: "Arabica 1kg", price: 69.00, image: Images.Products.arabica!, isAvailable: true, isFavorite: false),
//        .init(name: "Hawalian pizza", price: 109.99, image: Images.Products.hawalianPizza!, isAvailable: false, isFavorite: false),
//        .init(name: "Smoky burger", price: 96.00, image: Images.Products.smokyBurger!, isAvailable: true, isFavorite: false),
//        .init(name: "Robusta 1kg", price: 69.00, image: Images.Products.robusta!, isAvailable: true, isFavorite: false),
//    ]
    
    private let allProducts: [Product] = [
        .init(
            id: "1",
            name: "Pure Black",
            description: "Well-crafted coffee with a rich flavor and smooth texture.",
            basePrice: 59.00,
            image: Images.Products.pureBlack!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 10.00),
                ProductSize(id: "medium", name: "Medium", priceModifier: 12.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: true,
            isFavorite: true
        ),
        .init(
            id: "2",
            name: "Latte",
            description: "A creamy blend of coffee and milk.",
            basePrice: 59.00,
            image: Images.Products.latte!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 10.00),
                ProductSize(id: "medium", name: "Medium", priceModifier: 12.00),
                ProductSize(id: "large", name: "Large", priceModifier: 15.00)
            ],
            toppings: [
                ProductTopping(id: "extra_espresso", name: "Extra Espresso Shot", price: 10.00),
                ProductTopping(id: "whipped_cream", name: "Whipped Cream", price: 5.00)
            ],
            maxToppings: 2,
            isAvailable: true,
            isFavorite: true
        ),
        .init(
            id: "3",
            name: "Cappuccino",
            description: "Dark, rich espresso under a smoothed and stretched layer of thick milk foam.",
            basePrice: 69.00,
            image: Images.Products.capuccino!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 0.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: [
                ProductTopping(id: "chocolate_sprinkles", name: "Chocolate Sprinkles", price: 5.00),
                ProductTopping(id: "cinnamon", name: "Cinnamon", price: 5.00)
            ],
            maxToppings: 2,
            isAvailable: true,
            isFavorite: true
        ),
        .init(
            id: "4",
            name: "Arabica 1kg",
            description: "Premium Arabica coffee beans for a rich flavor.",
            basePrice: 69.00,
            image: Images.Products.arabica!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 5.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: true,
            isFavorite: true
        ),
        .init(
            id: "5",
            name: "Hawaiian Pizza",
            description: "Delicious pizza topped with pineapple and ham.",
            basePrice: 109.99,
            image: Images.Products.hawalianPizza!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 5.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: false,
            isFavorite: true
        ),
        .init(
            id: "6",
            name: "Smoky Burger",
            description: "Juicy beef burger with a smoky barbecue sauce.",
            basePrice: 96.00,
            image: Images.Products.smokyBurger!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 0.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: true,
            isFavorite: true
        ),
        
        .init(
            id: "7",
            name: "Robusta 1kg",
            description: "Bold and rich Robusta coffee beans.",
            basePrice: 69.00,
            image: Images.Products.robusta!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 0.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: true,
            isFavorite: true
        ),
        
        .init(
            id: "1",
            name: "Pure Black",
            description: "Well-crafted coffee with a rich flavor and smooth texture.",
            basePrice: 59.00,
            image: Images.Products.pureBlack!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 10.00),
                ProductSize(id: "medium", name: "Medium", priceModifier: 12.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: true,
            isFavorite: false
        ),
        .init(
            id: "2",
            name: "Latte",
            description: "A creamy blend of coffee and milk.",
            basePrice: 59.00,
            image: Images.Products.latte!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 10.00),
                ProductSize(id: "medium", name: "Medium", priceModifier: 12.00),
                ProductSize(id: "large", name: "Large", priceModifier: 15.00)
            ],
            toppings: [
                ProductTopping(id: "extra_espresso", name: "Extra Espresso Shot", price: 10.00),
                ProductTopping(id: "whipped_cream", name: "Whipped Cream", price: 5.00)
            ],
            maxToppings: 2,
            isAvailable: true,
            isFavorite: false
        ),
        .init(
            id: "3",
            name: "Cappuccino",
            description: "Dark, rich espresso under a smoothed and stretched layer of thick milk foam.",
            basePrice: 69.00,
            image: Images.Products.capuccino!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 0.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: [
                ProductTopping(id: "chocolate_sprinkles", name: "Chocolate Sprinkles", price: 500),
                ProductTopping(id: "cinnamon", name: "Cinnamon", price: 5.00)
            ],
            maxToppings: 2,
            isAvailable: true,
            isFavorite: false
        ),
        .init(
            id: "4",
            name: "Arabica 1kg",
            description: "Premium Arabica coffee beans for a rich flavor.",
            basePrice: 69.00,
            image: Images.Products.arabica!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 0.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: true,
            isFavorite: false
        ),
        .init(
            id: "5",
            name: "Hawaiian Pizza",
            description: "Delicious pizza topped with pineapple and ham.",
            basePrice: 109.99,
            image: Images.Products.hawalianPizza!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 0.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: false,
            isFavorite: false
        ),
        .init(
            id: "6",
            name: "Smoky Burger",
            description: "Juicy beef burger with a smoky barbecue sauce.",
            basePrice: 96.00,
            image: Images.Products.smokyBurger!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 0.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: true,
            isFavorite: false
        ),
        .init(
            id: "7",
            name: "Robusta 1kg",
            description: "Bold and rich Robusta coffee beans.",
            basePrice: 69.00,
            image: Images.Products.robusta!,
            sizes: [
                ProductSize(id: "small", name: "Small", priceModifier: 0.00),
                ProductSize(id: "large", name: "Large", priceModifier: 10.00)
            ],
            toppings: nil,
            maxToppings: nil,
            isAvailable: true,
            isFavorite: false
        )
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
