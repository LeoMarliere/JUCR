//
//  MainContentView.swift
//  JUCR
//
//  Created by Leo Marliere on 23/03/2024.
//

import SwiftUI

struct MainContentView: View {
    
    @State private var viewModel: MainModel?
    @State private var isViewModelLoaded = false
    @State private var isSecondViewExpanded = false
    @State var safeAreaInsets: EdgeInsets = .init()
    
    var body: some View {
        if !isViewModelLoaded {
            ProgressView() // Show a loading indicator while fetching the view model
                .onAppear { fetchMockViewModel() }
        }
        
        else {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    if !isSecondViewExpanded {
                        CarStateView(viewModel: viewModel!.car)
                            .frame(height: geometry.safeAreaInsets.top + (geometry.size.height * 0.4))
                            .padding(.top, geometry.safeAreaInsets.top)
                        InformationsView(statistiques: viewModel!.statistiquesList, superCharges: viewModel!.nearbyChargesList)
                            .frame(height: geometry.size.height * 0.6)
                            .padding(.bottom, geometry.safeAreaInsets.bottom)
                            .cornerRadius(10)
                        
                        
                    } else {
                        CarStateSmallerView(viewModel: viewModel!.car)
                            .frame(height: geometry.safeAreaInsets.top + (geometry.size.height * 0.2))
                            .padding(.top, geometry.safeAreaInsets.top)
                        InformationsView(statistiques: viewModel!.statistiquesList, superCharges: viewModel!.nearbyChargesList)
                            .frame(height: geometry.size.height * 0.8)
                            .padding(.bottom, geometry.safeAreaInsets.bottom)
                            .cornerRadius(10)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .gesture(DragGesture()
                .onChanged { gesture in
                    let translation = gesture.translation.height
                    if translation < -50 {
                        isSecondViewExpanded = true
                    } else if translation > 50 {
                        isSecondViewExpanded = false
                    }
                }
            )
        }
    }
}


extension MainContentView {
    
    private func fetchMockViewModel() {
        
        let car: Car = Car(ownerName: "Leo", model: "Tesla Model X", chargingState: true, chargingTime: "45 MIN", batteryState: 68)
        
        let statistiquesList: [Statistiques] = [
            Statistiques(stat: "240 Volts", statType: MagicStrings.stat_volt),
            Statistiques(stat: "540 Km", statType: MagicStrings.stat_charge),
            Statistiques(stat: "20m", statType: MagicStrings.stat_time)
        ]
        
        let superchargesList: [Supercharges] = [
            Supercharges(address: "Ranchview DR. Richardson", availableSlots: "4/10 Available", distance: "1.2 km"),
            Supercharges(address: "Thorniridge Cir. SHiloh", availableSlots: "6/10 Available", distance: "2.6 km"),
            Supercharges(address: "Elgin St. Celina", availableSlots: "1/10 Available", distance: "15 km"),
            Supercharges(address: "Westheimer Rd. Santa Ana", availableSlots: "8/10 Available", distance: "34.5 km"),
            Supercharges(address: "Lambersart St. Anne", availableSlots: "4/10 Available", distance: "67.5 km"),
            Supercharges(address: "Westminster Boulevard", availableSlots: "10/10 Available", distance: "124.2 km")
        ]
        
        self.viewModel = MainModel(car: car, statistiquesList: statistiquesList, nearbyChargesList: superchargesList)
        self.isViewModelLoaded = true
    }
}

