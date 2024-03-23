//
//  MainModel.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

class MainModel: Identifiable, ObservableObject, Equatable {
    
    @Published var car: Car
    @Published var statistiquesList: [Statistiques]
    @Published var nearbyChargesList: [Supercharges]
    
    init(car: Car, statistiquesList: [Statistiques], nearbyChargesList: [Supercharges]) {
        self.car = car
        self.statistiquesList = statistiquesList
        self.nearbyChargesList = nearbyChargesList
    }
    
    static func == (lhs: MainModel, rhs: MainModel) -> Bool {
        return lhs.car == rhs.car &&
        lhs.statistiquesList == rhs.statistiquesList &&
        lhs.nearbyChargesList == rhs.nearbyChargesList
    }
}
