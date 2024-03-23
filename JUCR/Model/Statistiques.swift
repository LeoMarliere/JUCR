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
    
    init(stat: String, statType: String) {
        self.stat = stat
        self.statType = statType
        
        switch statType {
        case MagicStrings.stat_volt:
            self.image = UIImage(named: "charging_station")!
        case MagicStrings.stat_charge:
            self.image = UIImage(named: "battery_half")!
        case MagicStrings.stat_time:
            self.image = UIImage(named: "hourglass_half")!
        default:
            self.image = UIImage(named: "hourglass_half")!
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
