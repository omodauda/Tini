//
//  StoreModel.swift
//  Tini
//
//  Created by Omodauda on 22/12/2024.
//

import Foundation

struct StoreModel {
    let name: String
    let address: String
    let isFavorite: Bool
    let workingHours: String
    let phone: String
}

struct StoresGroup {
    let title: String
    var stores: [StoreModel]
}
