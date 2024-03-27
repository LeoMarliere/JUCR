//
//  MainViewModel.swift
//  JUCR
//
//  Created by Leo Marliere on 27/03/2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var mainModel: MainModel?
    @Published var isViewModelLoaded = false
    @Published var isSecondViewExpanded = false
    
    func fetchMainViewModel() {
        // Simulated network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            let car: Car = Car(ownerName: "Leo", model: MagicStrings.carModel_TeslaX, chargingState: true, chargingTime: "45 MIN", batteryState: 68)
            
            let statistiquesList: [Statistiques] = [
                Statistiques(stat: "240 Volts", statType: MagicStrings.stat_volt),
                Statistiques(stat: "540 Km", statType: MagicStrings.stat_charge),
                Statistiques(stat: "687 Km", statType: MagicStrings.stat_travel),
                Statistiques(stat: "20m", statType: MagicStrings.stat_time)
            ]
            
            let superchargesList: [Supercharges] = [
                Supercharges(address: "Ranchview DR. Richardson", availableSlots: "4/10 Available", distance: "1.2 km"),
                Supercharges(address: "Thorniridge Cir. SHiloh", availableSlots: "6/10 Available", distance: "2.6 km"),
                Supercharges(address: "Elgin St. Celina", availableSlots: "1/10 Available", distance: "15 km"),
                Supercharges(address: "Westheimer Rd. Santa Ana", availableSlots: "8/10 Available", distance: "34.5 km"),
                Supercharges(address: "Lambersart St. Anne", availableSlots: "4/10 Available", distance: "67.5 km"),
                Supercharges(address: "Thorniridge Cir. SHiloh", availableSlots: "6/10 Available", distance: "2.6 km"),
                Supercharges(address: "Elgin St. Celina", availableSlots: "1/10 Available", distance: "15 km"),
                Supercharges(address: "Westheimer Rd. Santa Ana", availableSlots: "8/10 Available", distance: "34.5 km"),
                Supercharges(address: "Lambersart St. Anne", availableSlots: "4/10 Available", distance: "67.5 km"),
                Supercharges(address: "Thorniridge Cir. SHiloh", availableSlots: "6/10 Available", distance: "2.6 km"),
                Supercharges(address: "Elgin St. Celina", availableSlots: "1/10 Available", distance: "15 km"),
                Supercharges(address: "Westheimer Rd. Santa Ana", availableSlots: "8/10 Available", distance: "34.5 km"),
                Supercharges(address: "Lambersart St. Anne", availableSlots: "4/10 Available", distance: "67.5 km"),
                Supercharges(address: "Thorniridge Cir. SHiloh", availableSlots: "6/10 Available", distance: "2.6 km"),
                Supercharges(address: "Elgin St. Celina", availableSlots: "1/10 Available", distance: "15 km"),
                Supercharges(address: "Westheimer Rd. Santa Ana", availableSlots: "8/10 Available", distance: "34.5 km"),
                Supercharges(address: "Lambersart St. Anne", availableSlots: "4/10 Available", distance: "67.5 km"),
                Supercharges(address: "Westminster Boulevard", availableSlots: "10/10 Available", distance: "124.2 km")
            ]
            
            self.mainModel = MainModel(car: car, statistiquesList: statistiquesList, nearbyChargesList: superchargesList)
            self.isViewModelLoaded = true
        }
    }
}
