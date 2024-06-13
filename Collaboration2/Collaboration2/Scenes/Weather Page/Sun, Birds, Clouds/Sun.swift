//
//  SunBirdsClouds.swift
//  Collaboration2
//
//  Created by Giorgi Michitashvili on 6/12/24.
//

import SwiftUI
import SpriteKit

struct Sun: View {
    var body: some View {
        
        Circle()
            .fill(LinearGradient(colors: [Color(hex: 0xFFD88B), Color(hex: 0xFFA900)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
            .shadow(color: Color(hex: 0xFFD88B), radius: 15)
            .rotationEffect(.degrees(360))
            .frame(width: 138.18, height: 138.18)
            
    }
}


extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}


#Preview {
    Sun()
}


