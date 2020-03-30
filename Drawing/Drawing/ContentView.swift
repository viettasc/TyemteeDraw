//
//  ContentView.swift
//  Drawing
//
//  Created by Viettasc Doan on 3/30/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

// Spirograph = @ shape

struct RectangleCycling: View {
    var amount = 0.0
    var steps = 60
    var body: some View {
        ZStack {
            ForEach(0...steps, id: \.self) { value in
                RoundedRectangle(cornerRadius: 23)
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

struct ContentView: View {
    
    @State var size: CGFloat = 0.2

    var body: some View {
        ZStack {
            Color.pink.opacity(Double(size))
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("Tyemtee")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                ZStack {
                    Image("tyemtee")
                        .resizable()
                        .scaledToFit()
                        .padding(55)
                    RectangleCycling(amount: Double(self.size))
                        .scaledToFit()
                        .padding()
                }
                VStack(spacing: 0) {
                    Triangle()
                        .frame(width: 100, height: 100)
                    Rectangle()
                        .frame(width: 30, height: 100)
                }
                .foregroundColor(.white)
                .scaleEffect(size)
                Slider(value: $size)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


