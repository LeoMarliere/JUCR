//
//  Statistiques.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

class Statistiques: Identifiable, ObservableObject, Equatable {
    
    var image: UIImage
    var stat: String
    var statType: String
    var iconColor: Color
    var iconBackgroundColor: Color
    
    init(stat: String, statType: String) {
        self.stat = stat
        self.statType = statType
        
        switch statType {
        case MagicStrings.stat_volt:
            self.image = UIImage(named: "charging_station")!
            self.iconColor = Color(.red)
            self.iconBackgroundColor = MagicNumbers.customColor_red
        case MagicStrings.stat_charge:
            self.image = UIImage(named: "battery_half")!
            self.iconColor = Color(.yellow)
            self.iconBackgroundColor = MagicNumbers.customColor_yellow
        case MagicStrings.stat_time:
            self.image = UIImage(named: "hourglass_half")!
            self.iconColor = Color(.blue)
            self.iconBackgroundColor = MagicNumbers.customColor_blue
        case MagicStrings.stat_travel:
            self.image = UIImage(named: "car")!
            self.iconColor = Color(.purple)
            self.iconBackgroundColor = MagicNumbers.customColor_purple
        default:
            self.image = UIImage(named: "hourglass_half")!
            self.iconColor = Color(.red)
            self.iconBackgroundColor = MagicNumbers.customColor_red
        }
    }
    
    static func == (lhs: Statistiques, rhs: Statistiques) -> Bool {
        return lhs.image == rhs.image &&
        lhs.stat == rhs.stat &&
        lhs.statType == rhs.statType
    }
}
