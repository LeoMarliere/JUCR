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
           VStack {
               Image(uiImage: statistique.image) // Use UIImage from Statistiques
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 50, height: 50)
                   .foregroundColor(.blue) // Customize image color
               
               Text(statistique.stat)
                   .font(.headline)
                   .foregroundColor(.black)
                   .padding(.top, 5)
               
               Text(statistique.statType)
                   .font(.subheadline)
                   .foregroundColor(.gray)
                   .padding(.top, 2)
           }
           .padding(10)
           .background(Color.white) // Customize cell background color
           .cornerRadius(10)
           .shadow(radius: 3)
       }
}

struct StatistiqueList: View {
    
    @ObservedObject var viewModel: StatistiqueViewModel

    var body: some View {
        VStack {
            Text(MagicStrings.title_stat)
                .font(.headline)
                .padding(.horizontal)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.stats) { stat in
                        StatistiqueView(statistique: stat)
                    }
                }
            }
        }
    }
}

struct StatistiqueList_Previews: PreviewProvider {
    static var previews: some View {
        let stats = [
            Statistiques(stat: "240 Volts", statType: MagicStrings.stat_volt),
            Statistiques(stat: "5.46 Km", statType: MagicStrings.stat_charge),
            Statistiques(stat: "23Min", statType: MagicStrings.stat_time)
        ]
        
        let viewModel = StatistiqueViewModel(stats: stats)
        return StatistiqueList(viewModel: viewModel)
    }
}
