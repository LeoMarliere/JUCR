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
        HStack(spacing: 10) {
            
            VStack(alignment:.leading) {
                Text(viewModel.model)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                
                HStack(alignment: .top, content: {
                    Text("Charging :")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white)
                    Image(systemName: "bolt.fill")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white)
                    Text(viewModel.batteryState.description + "%")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.white)
                })
            }
            .padding(.leading, 10)
            
            Image(uiImage: viewModel.carImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.4)
                .padding(.trailing, 10)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 232.0/255.0, green: 67.0/255.0, blue: 96.0/255.0))
    }
}
