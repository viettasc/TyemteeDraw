//
//  PathView.swift
//  Drawing
//
//  Created by Viettasc Doan on 3/30/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y:  300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            //            path.addLine(to: CGPoint(x: 100, y: 300))
        }
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        //        .stroke(Color.blue.opacity(0.25), lineWidth: 10)
        //            .stroke(
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
