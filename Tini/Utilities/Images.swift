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
        static let slick = UIImage(named: "Slick")
        static let currentPageSlick = UIImage(named: "CurrentPageSlick")
    }
    
    static let backIcon = UIImage(systemName: "chevron.backward")
    static let searchIcon = UIImage(systemName: "magnifyingglass")
    static let pickupStoreLogo = UIImage(named: "PickupStoreLogo")
    static let rightIcon = UIImage(systemName: "chevron.right")
    static let deliveryAddressLogo = UIImage(named: "DeliveryAddressLogo")
    static let downIcon = UIImage(systemName: "chevron.down")
    
    struct Products {
        static let pureBlack = UIImage(named: "PureBlack")
        static let latte = UIImage(named: "Latte")
        static let capuccino = UIImage(named: "Capuccino")
        static let arabica = UIImage(named: "Arabica")
        static let hawalianPizza = UIImage(named: "HawalianPizza")
        static let smokyBurger = UIImage(named: "SmokyBurger")
        static let robusta = UIImage(named: "Robusta")
    }
    
    static let addressIcon = UIImage(named: "AddressIcon")
    static let liveLocationIcon = UIImage(named: "LiveLocationIcon")
    static let editIcon = UIImage(named: "EditIcon")
    static let addIcon = UIImage(named: "AddIcon")
    static let trashIcon = UIImage(named: "TrashIcon")
    static let storeIcon = UIImage(named: "StoreIcon")
    static let favIcon = UIImage(systemName: "heart.fill")
    static let favOutlineIcon = UIImage(systemName: "heart")
    static let emptyStateSvg = UIImage(named: "EmptyStateSvg")
    static let checkBox = UIImage(systemName: "checkmark.square.fill")
    static let cartIcon = UIImage(systemName: "cart")
    static let couponIcon = UIImage(named: "CouponIcon")
    static let clockIcon = UIImage(systemName: "clock.fill")
    static let closeIcon = UIImage(systemName: "xmark")
    static let checkBoxCircle = UIImage(systemName: "checkmark.circle.fill")
    static let storeImage = UIImage(named: "StoreImage")
    static let phoneIcon = UIImage(systemName: "phone.fill")
    static let emptyOrdersSvg = UIImage(named: "EmptyOrderSvg")
    
    struct Orders {
        static let orderPreparing = UIImage(named: "OrderPreparing")
        static let orderDelivering = UIImage(named: "OrderDelivering")
        static let orderDelivered = UIImage(named: "OrderDelivered")
        static let orderFailed = UIImage(named: "OrderFailed")
        static let orderReceived = UIImage(named: "OrderReceived")
        static let orderReadyPickup = UIImage(named: "OrderReadyPickup")
        static let orderCompleted = UIImage(named: "OrderCompleted")
    }
    
    static let momo = UIImage(named: "Momo")
    static let profileCoverImage = UIImage(named: "ProfileCoverImage")
    static let profileAvatarImage = UIImage(named: "AvatarImage")
    static let userCardBg = UIImage(named: "UserCardBg")
    static let barcode = UIImage(named: "Barcode")
    static let headset = UIImage(named: "Headset")
    static let emptyReservation = UIImage(named: "EmptyReservation")
    static let reservationBg = UIImage(named: "ReservationBg")
    static let timeoutTableImg = UIImage(named: "TimeoutTable")
}
