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
    var chargingTime: String
    var batteryState: CGFloat
    var carImage: UIImage
    
    init(ownerName: String, model: String, chargingState: Bool, chargingTime: String, batteryState: CGFloat) {
        self.ownerName = ownerName
        self.model = model
        self.chargingState = chargingState
        self.chargingTime = chargingTime
        self.batteryState = batteryState
        
        switch model {
        case MagicStrings.carModel_TeslaS:
            self.carImage = UIImage(named: "TeslaS")!
        case MagicStrings.carModel_TeslaX:
            self.carImage = UIImage(named: "TeslaX")!
        default:
            self.carImage = UIImage(named: "TeslaX")!
        }
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.ownerName == rhs.ownerName &&
        lhs.model == rhs.model &&
        lhs.chargingState == rhs.chargingState &&
        lhs.batteryState == rhs.batteryState
    }
}
