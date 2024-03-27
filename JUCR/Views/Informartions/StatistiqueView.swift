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
                .font(.system(size: MagicNumbers.fontSize_subtitle, weight: .bold))
                .foregroundColor(.black)
                .padding(.bottom, 2)
            
            Text(statistique.statType)
                .font(.system(size: MagicNumbers.fontSize_regular, weight: .regular))
                .foregroundColor(.gray)
                .padding(.bottom, 10)
        }
        .frame(width: 140, height: 120)
        .background(MagicNumbers.customColor_statsBackground)
        .shadow(radius: 3)
        .cornerRadius(10)
    }
}
