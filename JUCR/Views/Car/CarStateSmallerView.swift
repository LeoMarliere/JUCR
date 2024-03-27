//
//  CarStateSmallerView.swift
//  JUCR
//
//  Created by Leo Marliere on 25/03/2024.
//

import SwiftUI

struct CarStateSmallerView: View {
    
    @State var viewModel: Car
    
    var body: some View {
        VStack {
            HStack(spacing: 30) {
                VStack(alignment:.leading) {
                    Text(viewModel.model)
                        .font(.system(size: MagicNumbers.fontSize_title, weight: .bold))
                        .foregroundColor(.white)
                    
                    HStack(alignment: .top, content: {
                        Text(MagicStrings.carState_charging)
                            .font(.system(size: MagicNumbers.fontSize_regular, weight: .regular))
                            .foregroundColor(.white)
                        Image(systemName: MagicStrings.icon_bolt)
                            .font(.system(size: MagicNumbers.fontSize_regular, weight: .regular))
                            .foregroundColor(.white)
                        Text(viewModel.batteryState.description + "%")
                            .font(.system(size: MagicNumbers.fontSize_regular, weight: .regular))
                            .foregroundColor(.white)
                    })
                }
                
                Image(uiImage: viewModel.carImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.4)
            }
            .padding(.bottom, 20)
            
            Image(systemName: MagicStrings.icon_downArrow)
                .font(.system(size: MagicNumbers.fontSize_regular, weight: .regular))
                .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, -30)
        .background(MagicNumbers.customColor_mainBackground)
    }
}
