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
                          .font(.headline)
                      
                      Text(charge.availableSlots)
                          .font(.subheadline)
                          .foregroundColor(.gray)
                  }
                  .padding(.vertical, 8)
                  
                  Spacer()
                  
                  VStack {
                      Image(systemName: "location")
                          .font(.title)
                          .foregroundColor(.gray)
                      
                      Text(charge.distance)
                          .font(.caption)
                          .foregroundColor(.gray)
                  }
              }
              .padding(.horizontal)
              .background(Color.white)
              .cornerRadius(10)
              .shadow(radius: 3)
          }
}

struct SuperchargesList: View {
    
    @ObservedObject var viewModel: SuperchargesViewModel

    var body: some View {
        VStack {
            Text(MagicStrings.title_charges)
                .font(.headline)
                .padding(.horizontal)
            ScrollView(.vertical) {
                HStack {
                    ForEach(viewModel.charges) { charge in
                        SuperchargesView(charge: charge)
                    }
                }
            }
        }
    }
}
