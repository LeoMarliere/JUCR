//
//  MainModel.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

class MainModel: Identifiable, ObservableObject, Equatable {
    
    @Published var statistiquesList: [Statistiques]
    @Published var nearbyChargesList: [Supercharges]
    
    init() {}
    
    init(statistiquesList: [Statistiques], nearbyChargesList: [Supercharges]) {
        self.statistiquesList = statistiquesList
        self.nearbyChargesList = nearbyChargesList
    }
    
    static func == (lhs: MainModel, rhs: MainModel) -> Bool {
        return lhs.statistiquesList == rhs.statistiquesList &&
        lhs.nearbyChargesList == rhs.nearbyChargesList
    }
}
