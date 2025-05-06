//
//  StoresViewModel.swift
//  Tini
//
//  Created by Omodauda on 22/12/2024.
//

import Foundation
import Combine

class StoresViewModel {
    
    static let shared = StoresViewModel()
    
    private init() {
        loadSections()
    }
    
    private var allStores: [StoreModel] = [
        StoreModel(name: "SB Han Thuyen", address: "11-13 Han Thuyen, D1, HCM city", isFavorite: false, workingHours: "07:00 - 22:00", phone: "08141637335"),
        StoreModel(name: "SB Nguyen Van Troi SB Nguyen Van Troi SB Nguyen Van Troi", address: "117 Nguyen Dinh Chieu, D3, HCM city", isFavorite: false, workingHours: "07:00 - 22:00", phone: "08141637335"),
        StoreModel(name: "SB Phan Xich Long", address: "214-216 Phan Xich Long, D.Phu Nhuan 214-216 Phan Xich Long, D.Phu Nhuan", isFavorite: false, workingHours: "07:00 - 22:00", phone: "08141637335"),
        StoreModel(name: "SB Van Hanh Mall", address: "11 Su Van Hanh, D10, HCM city", isFavorite: false, workingHours: "07:00 - 22:00", phone: "08141637335"),
        StoreModel(name: "SB CMT8", address: "24 Ba Cach Mang Thang 8, D3, HCM city", isFavorite: false, workingHours: "07:00 - 22:00", phone: "08141637335"),
        StoreModel(name: "SB Leman", address: "2 Hong Ha St, D.Tan Binh, HCM city", isFavorite: false, workingHours: "07:00 - 22:00", phone: "08141637335"),
        StoreModel(name: "SB Ibis", address: "119 Pho Quang, Phu Nhuan, HCM city", isFavorite: false, workingHours: "07:00 - 22:00", phone: "08141637335"),
    ]
    
    private var sectionsSubject = CurrentValueSubject<[StoresGroup], Never>([])
    
    var sectionsPublisher: AnyPublisher<[StoresGroup], Never> {
        sectionsSubject.eraseToAnyPublisher()
    }
    
    func loadSections() {
        let favorites = allStores.filter { $0.isFavorite }
        let others = allStores.filter { !$0.isFavorite }
        
        var sections: [StoresGroup] = []
        if !favorites.isEmpty {
            sections.append(StoresGroup(title: "Favorite stores", stores: favorites))
        }
        if !others.isEmpty {
            sections.append(StoresGroup(title: "Other stores", stores: others))
        }
        sectionsSubject.send(sections)
    }
    
    func searchStores(with query: String) {
        if query.isEmpty {
            loadSections()
        } else {
            let filteredFavorites = allStores.filter { $0.isFavorite && $0.name.lowercased().contains(query.lowercased()) }
            let filteredOthers = allStores.filter { !$0.isFavorite && $0.name.lowercased().contains(query.lowercased()) }
            
            var sections: [StoresGroup] = []
            if !filteredFavorites.isEmpty {
                sections.append(StoresGroup(title: "Favorite stores", stores: filteredFavorites))
            }
            if !filteredOthers.isEmpty {
                sections.append(StoresGroup(title: "Other stores", stores: filteredOthers))
            }
            sectionsSubject.send(sections)
        }
    }
    
    func toggleFavorite(store: StoreModel) {
        let index = allStores.firstIndex(where: {$0.name == store.name})
        if index != nil {
            allStores[index!].isFavorite.toggle()
            loadSections()
        }
    }
    
    func getStore(named name: String) -> StoreModel? {
        return allStores.first(where: { $0.name == name })
    }
}
