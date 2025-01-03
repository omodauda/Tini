//
//  DeliveryAddressViewModel.swift
//  Tini
//
//  Created by Omodauda on 13/12/2024.
//

import Foundation

struct DeliveryAddressViewModel {
    
    static let shared = DeliveryAddressViewModel()
    
    let deliveryAddress: [DeliveryAddressModel] = [
        .init(address: "128 Nguyen Dinh Chieu, D.3, HCM", recipientName: "Nick", recipientPhoneNumber: "0896969696"),
        .init(address: "128 Nguyen Dinh Chieu, D.3, HCM", recipientName: "Tu", recipientPhoneNumber: "0896969696"),
    ]
}
