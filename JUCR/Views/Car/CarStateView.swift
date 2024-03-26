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
        VStack() {
            Text(getGreeting(carOwnerName: viewModel.ownerName))
                .font(.system(size: MagicNumbers.fontSize_regular, weight: .light))
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom, 4)
            
            ZStack(alignment: .top) {
                
                if(viewModel.chargingState) {
                    Text(MagicStrings.carState_mainTitle)
                        .font(.system(size: MagicNumbers.fontSize_bigTitle, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Image(uiImage: viewModel.carImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
            }
            
            Text(MagicStrings.carState_chargingTime + viewModel.chargingTime)
                .font(.system(size: MagicNumbers.fontSize_regular, weight: .light))
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.top, -50)
            
            ChargingAnimationView(chargingValue: viewModel.batteryState)
                .padding(.top, -20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MagicNumbers.customColor_mainBackground)
    }
}

extension CarStateView {
    
    private func getGreeting(carOwnerName: String) -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        
        if hour < 12 {
            return MagicStrings.carState_morning + carOwnerName
        } else {
            return MagicStrings.carState_afternoon + carOwnerName
        }
    }
}
 
