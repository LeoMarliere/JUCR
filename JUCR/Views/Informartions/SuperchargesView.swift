//
//  NearbyChargesView.swift
//  JUCR
//
//  Created by Leo Marliere on 22/03/2024.
//

import SwiftUI

struct SuperchargesView: View {
    
    var charge: Supercharges
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(charge.address)
                    .font(.system(size: MagicNumbers.fontSize_regular, weight: .bold))
                    .padding(.bottom, 2)
                
                Text(charge.availableSlots)
                    .font(.system(size: MagicNumbers.fontSize_small, weight: .light))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
            
            Spacer()
            
            VStack {
                Image(uiImage: UIImage(named: MagicStrings.icon_location)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                
                Text(charge.distance)
                    .font(.system(size: MagicNumbers.fontSize_tiny, weight: .light))
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
        .padding(10)
        .background(MagicNumbers.customColor_statsBackground)
        .cornerRadius(10)
    }
}

