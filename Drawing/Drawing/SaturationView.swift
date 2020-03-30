//
//  SaturationView.swift
//  Drawing
//
//  Created by Viettasc Doan on 3/30/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct SaturationView: View {
    @State private var amount: CGFloat = 0.0
    var body: some View {
        VStack {
            Image("tyemtee")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SaturationView_Previews: PreviewProvider {
    static var previews: some View {
        SaturationView()
    }
}
