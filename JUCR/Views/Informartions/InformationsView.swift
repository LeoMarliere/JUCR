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
            Spacer()
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
        .background(InformationViewShape())
    }
    
}

struct InformationViewShape: View {
    let tl: CGFloat = 20.0
    let tr: CGFloat = 20.0
    let bl: CGFloat = 0.0
    let br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height

                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                
                let middleX = w / 2
                let curveDeep = h * 0.08
                let curveEndpoint = CGPoint(x: middleX, y: curveDeep)
                let curveStart = CGPoint(x: middleX - (w * 0.2), y: 0)
                let curveEnd = CGPoint(x: middleX + (w * 0.2), y: 0)
                
                path.move(to: curveStart)
                path.addLine(to: curveEndpoint)
                path.addLine(to: curveEnd)

                path.closeSubpath()
            }
            .fill(Color.white)
        }
    }
}
