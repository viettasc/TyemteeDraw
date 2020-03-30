//
//  PaintView.swift
//  Drawing
//
//  Created by Viettasc Doan on 3/30/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct PaintView: View {
    var body: some View {
        Text("Hello World")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
            .background(Color.pink.opacity(0.6))
    }
}

struct PaintView_Previews: PreviewProvider {
    static var previews: some View {
        PaintView()
    }
}
