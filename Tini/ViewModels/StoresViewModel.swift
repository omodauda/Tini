//
//  StoresViewModel.swift
//  Tini
//
//  Created by Omodauda on 22/12/2024.
//

import Foundation

class StoresViewModel {
    private let allStores: [StoreModel] = [
        StoreModel(name: "SB Han Thuyen", address: "11-13 Han Thuyen, D1, HCM city", isFavorite: true),
        StoreModel(name: "SB Nguyen Van Troi SB Nguyen Van Troi SB Nguyen Van Troi", address: "117 Nguyen Dinh Chieu, D3, HCM city", isFavorite: true),
        StoreModel(name: "SB Phan Xich Long", address: "214-216 Phan Xich Long, D.Phu Nhuan 214-216 Phan Xich Long, D.Phu Nhuan", isFavorite: true),
        StoreModel(name: "SB Van Hanh Mall", address: "11 Su Van Hanh, D10, HCM city", isFavorite: false),
        StoreModel(name: "SB CMT8", address: "24 Ba Cach Mang Thang 8, D3, HCM city", isFavorite: false),
        StoreModel(name: "SB Leman", address: "2 Hong Ha St, D.Tan Binh, HCM city", isFavorite: false),
        StoreModel(name: "SB Ibis", address: "119 Pho Quang, Phu Nhuan, HCM city", isFavorite: false),
    ]
    
    var sections: [StoresGroup] = []
    
    func loadSections() {
        let favorites = allStores.filter { $0.isFavorite }
        let others = allStores.filter { !$0.isFavorite }
        
        sections = []
        if !favorites.isEmpty {
            sections.append(StoresGroup(title: "Favorite stores", stores: favorites))
        }
        if !others.isEmpty {
            sections.append(StoresGroup(title: "Other stores", stores: others))
        }
    }
    
    func searchStores(with query: String) {
        if query.isEmpty {
            loadSections()
        } else {
            let filteredFavorites = allStores.filter { $0.isFavorite && $0.name.lowercased().contains(query.lowercased()) }
            let filteredOthers = allStores.filter { !$0.isFavorite && $0.name.lowercased().contains(query.lowercased()) }
            
            sections = []
            if !filteredFavorites.isEmpty {
                sections.append(StoresGroup(title: "Favorite stores", stores: filteredFavorites))
            }
            if !filteredOthers.isEmpty {
                sections.append(StoresGroup(title: "Other stores", stores: filteredOthers))
            }
        }
    }
}
