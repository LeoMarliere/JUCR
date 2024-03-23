//
//  Car.swift
//  JUCR
//
//  Created by Leo Marliere on 23/03/2024.
//

import SwiftUI

class Car: Identifiable, ObservableObject, Equatable {
    
    var ownerName: String
    var model: String
    var chargingState: Bool
    var batteryState: String
    
    init(ownerName: String, model: String, chargingState: Bool, batteryState: String) {
        self.ownerName = ownerName
        self.model = model
        self.chargingState = chargingState
        self.batteryState = batteryState
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.ownerName == rhs.ownerName &&
        lhs.model == rhs.model &&
        lhs.chargingState == rhs.chargingState &&
        lhs.batteryState == rhs.batteryState
    }
}
