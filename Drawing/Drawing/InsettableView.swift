//
//  InsettableView.swift
//  Drawing
//
//  Created by Viettasc Doan on 3/30/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

// InsettableShape: strokeBorder
extension Arc: InsettableShape {
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.amount += amount
        return arc
    }
}

struct InsettableView: View {
    var body: some View {
        Arc(start: .degrees(-90), end: .degrees(110), clockwise: true)
            .strokeBorder(Color.pink.opacity(0.6), lineWidth: 30)
    }
}

struct InsettableView_Previews: PreviewProvider {
    static var previews: some View {
        InsettableView()
    }
}
