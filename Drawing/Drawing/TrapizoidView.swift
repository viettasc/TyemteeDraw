//
//  TrapizoidView.swift
//  Drawing
//
//  Created by Viettasc Doan on 3/30/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct Trapezoid: Shape {
    var amount: CGFloat
    var animatableData: CGFloat {
        get { amount }
        set { self.amount = newValue }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: amount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - amount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        return path
    }
}

struct TrapezoidView: View {
    @State private var amount: CGFloat = 30
    var body: some View {
        Trapezoid(amount: amount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    self.amount = CGFloat.random(in: 10...90)
                }
        }
    }
}

struct TrapizoidView_Previews: PreviewProvider {
    static var previews: some View {
        TrapezoidView()
    }
}
