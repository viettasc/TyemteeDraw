//
//  Flower.swift
//  Drawing
//
//  Created by Viettasc Doan on 3/30/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

// draw flower (eoFill)

struct Flower: Shape {
    var petalOffset: Double = -20
    var pentalWidth: Double = 100
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // 16 eclips points
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            let original = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(pentalWidth), height: rect.width / 2))
            let rotated = original.applying(position)
            path.addPath(rotated)
        }
        return path
    }
}

struct FlowerView: View {
    @State private var pentalOffset = -20.0
    @State private var pentalWidth = 100.0
    var body: some View {
        VStack {
            Flower(petalOffset: pentalOffset, pentalWidth: pentalWidth)
//                .stroke(Color.pink.opacity(0.6), lineWidth: 1)
                .fill(Color.pink.opacity(0.6), style: FillStyle(eoFill: true, antialiased: true))
            Text("Offset")
            Slider(value: $pentalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            Text("Width")
            Slider(value: $pentalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct FlowerView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerView()
    }
}
