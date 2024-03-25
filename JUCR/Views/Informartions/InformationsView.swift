//
//  InofrmationsView.swift
//  JUCR
//
//  Created by Leo Marliere on 23/03/2024.
//

import SwiftUI

struct InformationsView: View {
    
    @State var statistiques: [Statistiques]
    @State var superCharges: [Supercharges]
    
    var body: some View {
        VStack {
            HStack {
                Text(MagicStrings.title_stat)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.leading, 10)
                
                
                Spacer()
                
                Button(action: {
                    // Add action for the button if needed
                }) {
                    Text(MagicStrings.subtitle_stats)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.trailing, 10)
                }
            }
            .padding(.bottom, 10)
            .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) { // Changed to .horizontal
                HStack(spacing: 20) { // Added HStack to display views horizontally
                    ForEach(statistiques) { statistique in
                        StatistiqueView(statistique: statistique)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            
            HStack {
                Text(MagicStrings.title_charges)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.leading, 10)
                
                Spacer()
                
                Button(action: {
                    // Add action for the button if needed
                }) {
                    Text(MagicStrings.subtitle_charges)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding(.trailing, 10)
                }
            }
            .padding(.bottom, 15)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(superCharges) { charge in
                        SuperchargesView(charge: charge)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
    }
}
