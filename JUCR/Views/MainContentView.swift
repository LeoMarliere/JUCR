//
//  MainContentView.swift
//  JUCR
//
//  Created by Leo Marliere on 23/03/2024.
//

import SwiftUI

struct MainContentView: View {
    
    @State private var viewModel: MainModel?
    
    var body: some View {
        
        TabView {
            StatistiqueListView(viewModel: StatistiqueListViewModel(stats: viewModel?.statistiquesList ?? []))
        }
        .onAppear {
            // Simulation of the fetching of the ViewModel Data
            // let url = URL(string: "https://getUserData")!
            // let (data, _) = try await URLSession.shared.data(from: url)
            self.viewModel = getMockViewModel()
        }
    }
    
}


extension MainContentView {
    
    private func getMockViewModel() -> MainModel {
        
        let car: Car = Car(ownerName: "Leo", model: "Tesla Model X", chargingState: true, batteryState: "68%")
        
        let statistiquesList: [Statistiques] = [
            Statistiques(stat: "240 Volts", statType: MagicStrings.stat_volt),
            Statistiques(stat: "540 Km", statType: MagicStrings.stat_charge),
            Statistiques(stat: "20m", statType: MagicStrings.stat_time)
        ]
        
        let superchargesList: [Supercharges] = [
            Supercharges(address: "32 Mager Strasse", availableSlots: "4/10 Available", distance: "3Km"),
            Supercharges(address: "211 Greifswalder Strasse", availableSlots: "6/10 Available", distance: "6Km"),
            Supercharges(address: "10 Rue de la Paix", availableSlots: "1/10 Available", distance: "15Km"),
            Supercharges(address: "16 Liberty Street", availableSlots: "8/10 Available", distance: "30Km")
        ]
        
        return MainModel(car: car, statistiquesList: statistiquesList, nearbyChargesList: superchargesList)
    }
}
