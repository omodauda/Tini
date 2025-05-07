//
//  DeliveryAddressModel.swift
//  Tini
//
//  Created by Omodauda on 13/12/2024.
//

import Foundation

struct DeliveryAddressModel: Identifiable {
    let id: UUID
    let address: String
    let city: String
    let district: String
    let ward: String
    let recipientName: String
    let recipientPhoneNumber: String
}
