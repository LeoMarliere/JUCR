//
//  NearbySupercharges.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

class Supercharges: Identifiable, ObservableObject, Equatable {
    
    var address: String
    var availableSlots: String
    var distance: String
    
    init(address: String, availableSlots: String, distance: String) {
        self.address = address
        self.availableSlots = availableSlots
        self.distance = distance
    }
    
    static func == (lhs: Supercharges, rhs: Supercharges) -> Bool {
        return lhs.address == rhs.address &&
        lhs.availableSlots == rhs.availableSlots &&
        lhs.distance == rhs.distance
    }
}
