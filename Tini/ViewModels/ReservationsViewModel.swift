//
//  ReservationsViewModel.swift
//  Tini
//
//  Created by Omodauda on 13/05/2025.
//

import Foundation
import Combine

class ReservationsViewModel {
    
    static let shared = ReservationsViewModel()
    
    private init() {}
    
    var reservationSubject = CurrentValueSubject<[TableReservationModel], Never>([
        TableReservationModel(id: UUID(), status: .past, storeAddress: "Lafenwa Itele", numberOfPeople: 2, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, time: "08:00", fullName: "Lawal Dauda", email: "omodauda.dl@gmail.com", phoneNumber: "08141637335", numberOfEderly: 1, numberOfChildren: 1, sittingArea: "Any", notes: ""),
        TableReservationModel(id: UUID(), status: .past, storeAddress: "Lafenwa Itele", numberOfPeople: 4, date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, time: "14:00", fullName: "Hassanah Taiwo", email: "omodauda.dl@gmail.com", phoneNumber: "08141637335", numberOfEderly: 0, numberOfChildren: 0, sittingArea: "Inside", notes: "Hello to everyone"),
        TableReservationModel(id: UUID(), status: .cancelled, storeAddress: "Lafenwa Itele", numberOfPeople: 13, date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, time: "06:00", fullName: "Emmanuel Olubusayo", email: "omodauda.dl@gmail.com", phoneNumber: "08141637335", numberOfEderly: 2, numberOfChildren: 6, sittingArea: "Outside", notes: "")
    ])
    
    var reservationsPublisher: AnyPublisher<[TableReservationModel], Never> {
        reservationSubject.eraseToAnyPublisher()
    }
    
    func reserveTable(reservation: TableReservationModel) {
        var currentReservations = reservationSubject.value
        currentReservations.insert(reservation, at: 0)
        reservationSubject.send(currentReservations)
    }
}
