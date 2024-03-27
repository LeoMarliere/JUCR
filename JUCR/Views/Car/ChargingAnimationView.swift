//
//  ChargingAnimationView.swift
//  JUCR
//
//  Created by Leo Marliere on 23/03/2024.
//

import SwiftUI

struct ChargingAnimationView: View {
    
    @State private var animationProgress: CGFloat = 0.0 
    var chargingValue: CGFloat
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: animationProgress)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 50, height: 50)
                .overlay(
                    VStack {
                        Image(systemName: MagicStrings.icon_bolt)
                            .foregroundColor(.white)
                            .font(.system(size: MagicNumbers.fontSize_small))
                        
                        Text(chargingValue.description + "%")
                            .foregroundColor(.white)
                            .font(.system(size: MagicNumbers.fontSize_small, weight: .bold))
                    }
                )
                .onAppear {
                    withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                        animationProgress = 1
                    }
                }
        }
    }
}
