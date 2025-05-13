//
//  TableReservationModel.swift
//  Tini
//
//  Created by Omodauda on 13/05/2025.
//

import Foundation

struct TableReservationModel: Identifiable {
    let id: UUID
    let status: TableReservationStatus
    let storeAddress: String
    let numberOfPeople: Int
    let date: Date
    let time: String
    let fullName: String
    let email: String
    let phoneNumber: String
    let numberOfEderly: Int
    let numberOfChildren: Int
    let sittingArea: String
    let notes: String?
}

enum TableReservationStatus {
    case reserved
    case cancelled
    case past
}
