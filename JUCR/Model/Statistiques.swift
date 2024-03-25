//
//  Statistiques.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

struct StatistiquesData: Codable, Equatable {
    
    let stat: String
    let statType: String
    
    static func == (lhs: StatistiquesData, rhs: StatistiquesData) -> Bool {
        return lhs.stat == rhs.stat &&
        lhs.statType == rhs.statType
    }
}


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
            self.iconBackgroundColor = Color(red: 236.0/255.0, green: 129.0/255.0, blue: 128.0/255.0)
        case MagicStrings.stat_charge:
            self.image = UIImage(named: "battery_half")!
            self.iconColor = Color(.yellow)
            self.iconBackgroundColor = Color(red: 235.0/255.0, green: 250.0/255.0, blue: 188.0/255.0)
        case MagicStrings.stat_time:
            self.image = UIImage(named: "hourglass_half")!
            self.iconColor = Color(.blue)
            self.iconBackgroundColor = Color(red: 191.0/255.0, green: 228.0/255.0, blue: 249.0/255.0)
        default:
            self.image = UIImage(named: "hourglass_half")!
            self.iconColor = Color(.blue)
            self.iconBackgroundColor = Color(red: 191.0/255.0, green: 228.0/255.0, blue: 249.0/255.0)
        }
    }
    
    static func == (lhs: Statistiques, rhs: Statistiques) -> Bool {
        return lhs.image == rhs.image &&
        lhs.stat == rhs.stat &&
        lhs.statType == rhs.statType
    }
}

class StatistiqueListViewModel: Identifiable, ObservableObject, Equatable {
    
    var stats: [Statistiques]
    
    init(stats: [Statistiques]) { self.stats = stats}
    
    static func == (lhs: StatistiqueListViewModel, rhs: StatistiqueListViewModel) -> Bool {
        return lhs.stats == rhs.stats
    }
}
