//
//  ChargingAnimationView.swift
//  JUCR
//
//  Created by Leo Marliere on 23/03/2024.
//

import SwiftUI

struct ChargingAnimationView: View {
    
    @State private var animationProgress: CGFloat = 0.0 // State to control animation progress
 var chargingValue: CGFloat
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: animationProgress)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 50, height: 50) // Size of the circle
                .overlay(
                    VStack {
                        Image(systemName: "bolt.fill") // Image inside the circle
                            .foregroundColor(.white)
                            .font(.system(size: 10))
                        
                        Text(chargingValue.description + "%") // Text below the image
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .bold))
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
