//
//  StatistiqueItem.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

struct StatistiqueView: View {
    
    var statistique: Statistiques
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack {
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(statistique.iconBackgroundColor)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                
                Image(uiImage: statistique.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tint(statistique.iconColor)
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
            }

            Text(statistique.stat)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.black)
                .padding(.bottom, 2)
            
            Text(statistique.statType)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)
                .padding(.bottom, 10)
        }
        .frame(width: 140, height: 120)
        .background(Color(red: 242.0/255.0, green: 242.0/255.0, blue: 243.0/255.0))
        .shadow(radius: 3)
        .cornerRadius(10)
    }
}
