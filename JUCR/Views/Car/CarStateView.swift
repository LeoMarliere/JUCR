//
//  CarStateView.swift
//  JUCR
//
//  Created by Leo Marliere on 23/03/2024.
//

import SwiftUI

struct CarStateView: View {
    
    @State var viewModel: Car
    
    var body: some View {
        VStack(spacing: 0) {
            Text(getGreeting(carOwnerName: viewModel.ownerName))
                .font(.system(size: 12, weight: .light))
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom, 4)
            
            ZStack(alignment: .top) {
                
                if(viewModel.chargingState) {
                    Text("Charging your car ...")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Image(uiImage: viewModel.carImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
            }
            
            Text("TIME TO END CHARGE : \(viewModel.chargingTime)")
                .font(.system(size: 12, weight: .light))
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            ChargingAnimationView(chargingValue: viewModel.batteryState)
                .padding(.top, 8)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 232.0/255.0, green: 67.0/255.0, blue: 96.0/255.0))
    }
}

extension CarStateView {
    
    private func getGreeting(carOwnerName: String) -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        
        if hour < 12 {
            return "Good Morning, " + carOwnerName
        } else {
            return "Good Afternoon, " + carOwnerName
        }
    }
}
 
