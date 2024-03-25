//
//  TopCornerRadiusShape.swift
//  JUCR
//
//  Created by Leo Marliere on 25/03/2024.
//

import SwiftUI

struct TopCornerRadiusShape: Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let corners: UIRectCorner = [.topLeft, .topRight]
        let topLeft = CGPoint(x: rect.minX, y: rect.minY + radius)
        path.move(to: topLeft)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + radius))
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.minY), tangent2End: CGPoint(x: rect.maxX - radius, y: rect.minY), radius: radius)
        path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.minY))
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.minY), tangent2End: CGPoint(x: rect.minX, y: rect.minY + radius), radius: radius)
        return path
    }
}

