//
//  CycleView.swift
//  Drawing
//
//  Created by Viettasc Doan on 3/30/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct Cycling: View {
    var amount = 0.0
    var steps = 100
    var body: some View {
        ZStack {
            ForEach(0...steps, id: \.self) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(
                        LinearGradient(gradient: Gradient(colors: [
                            self.color(for: value, brightness: 1),
                            self.color(for: value, brightness: 0.3)
                        ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

// ImagePaint
struct CycleView: View {
    @State private var cycle = 0.0
    var body: some View {
        VStack {
            Cycling(amount: self.cycle)
                .frame(width: 300, height: 300)
            Slider(value: $cycle)
        }
    }
}

struct CycleView_Previews: PreviewProvider {
    static var previews: some View {
        CycleView()
    }
}
