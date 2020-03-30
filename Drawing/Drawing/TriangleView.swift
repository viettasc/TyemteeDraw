//
//  TriangleView.swift
//  Drawing
//
//  Created by Viettasc Doan on 3/30/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // top mid
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        // bottom left
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        // bottom right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // top mid
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

// ~ circle
struct Arc: Shape {
    
    var start: Angle
    var end: Angle
    var clockwise: Bool
    var amount: CGFloat = 90
    
    func path(in rect: CGRect) -> Path {
        
        let rotation = Angle.degrees(90)
        let modifiedStart = start - rotation
        let modifiedEnd = end - rotation
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - amount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
        
    }
    
}

struct TriangleView: View {
    var body: some View {
        Arc(start: .degrees(0), end: .degrees(110), clockwise: true)
            .stroke(Color.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}

struct TriangleView_Previews: PreviewProvider {
    static var previews: some View {
        TriangleView()
    }
}

//ZStack {
//    Image("tyemtee")
//    Rectangle()
//        .fill(Color.pink.opacity(0.6))
//        .blendMode(.multiply)
//}
//.frame(width: 400, height: 500)
//.clipped()

//Image("tyemtee")
//.colorMultiply(Color.pink.opacity(0.6))

// ZStack {
//                Circle()
//                    .fill(Color.pink.opacity(0.6))
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(Color.blue.opacity(0.6))
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(Color.yellow.opacity(0.6))
//                    .frame(width: 200 * amount)
////                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
