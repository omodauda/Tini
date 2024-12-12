//
//  Images.swift
//  Tini
//
//  Created by Omodauda on 29/11/2024.
//

import UIKit

struct Images {
    struct Nav {
        static let home = UIImage(systemName: "house")
        static let store = UIImage(systemName: "storefront")
        static let order = UIImage(systemName: "text.page")
        static let profile = UIImage(systemName: "person.circle")
    }
    
    struct Home {
        static let storeLogo = UIImage(named: "StoreLogo")
        static let moreIcon = UIImage(systemName: "ellipsis")
        static let closeIcon = UIImage(systemName: "xmark.circle")
        static let pickupImage = UIImage(named: "PickupLogo")
        static let deliveryImage = UIImage(named: "DeliveryLogo")
        static let reservationImage = UIImage(named: "ReservationLogo")
        static let promoImage = UIImage(named: "PromoImage")
        static let discountImage = UIImage(named: "DiscountImage")
    }
    
    static let backIcon = UIImage(systemName: "chevron.backward")
    static let searchIcon = UIImage(systemName: "magnifyingglass")
    static let pickupStoreLogo = UIImage(named: "PickupStoreLogo")
    static let rightIcon = UIImage(systemName: "chevron.right")
}
