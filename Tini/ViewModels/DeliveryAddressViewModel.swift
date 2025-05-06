//
//  DeliveryAddressViewModel.swift
//  Tini
//
//  Created by Omodauda on 13/12/2024.
//

import Foundation
import Combine

struct DeliveryAddressViewModel {
    
    static let shared = DeliveryAddressViewModel()
    
    private var deliveryAddressSubject = CurrentValueSubject<[DeliveryAddressModel], Never>([
        .init(address: "128 Nguyen Dinh Chieu", city: "Ho Chi Minh", district: "District 1", ward: "Ward A", recipientName: "Nick", recipientPhoneNumber: "0896969696"),
        .init(address: "128 Nguyen Dinh Chieu", city: "Hanoi", district: "Ba Dinh", ward: "Ward 1", recipientName: "Tu", recipientPhoneNumber: "0896969696"),
    ])
    
    var deliveryAddressPublisher: AnyPublisher<[DeliveryAddressModel], Never>{
        deliveryAddressSubject.eraseToAnyPublisher()
    }
    
//    let deliveryAddress: [DeliveryAddressModel] = [
//        .init(address: "128 Nguyen Dinh Chieu, D.3, HCM", recipientName: "Nick", recipientPhoneNumber: "0896969696"),
//        .init(address: "128 Nguyen Dinh Chieu, D.3, HCM", recipientName: "Tu", recipientPhoneNumber: "0896969696"),
//    ]
    func addAddress(address: DeliveryAddressModel) {
        var currentAddresses = deliveryAddressSubject.value
        currentAddresses.append(address)
        deliveryAddressSubject.send(currentAddresses)
    }
}
