//
//  Birds.swift
//  Collaboration2
//
//  Created by Giorgi Michitashvili on 6/12/24.
//

import SwiftUI

struct Birds: View {
    @State private var moveRight = false

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Circle()
                    .fill(LinearGradient(colors: [Color(hex: 0xFFD88B), Color(hex: 0xFFA900)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                    .rotationEffect(.degrees(360))
                    .padding(.leading, -70)
                    .frame(width: 138.18, height: 138.18)
                
                birdView(offsetAmount: geometry.size.width * 0.25, delay: 0.0)
                VStack(spacing: 30) {
                    birdView(offsetAmount: geometry.size.width * 0.25, delay: 0.3)
                    birdView(offsetAmount: geometry.size.width * 0.25, delay: 0.6)
                }
                VStack(spacing: 30) {
                    birdView(offsetAmount: geometry.size.width * 0.25, delay: 0.9)
                    birdView(offsetAmount: geometry.size.width * 0.25, delay: 1.2)
                    birdView(offsetAmount: geometry.size.width * 0.25, delay: 1.5)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                LinearGradient(stops: [
                            .init(color: Color(hex: 0x2DB0DD), location: 0),
                            .init(color: Color(hex: 0x8EADE1), location: 1)
                                        ],
                               startPoint: UnitPoint(x: 0.5, y: 0),
                               endPoint: UnitPoint(x: 0.5, y: 1))
                .ignoresSafeArea()
            }
            .onAppear {
                startAnimations()
            }
        }
    }

    private func birdView(offsetAmount: CGFloat, delay: Double) -> some View {
        Image("bird")
            .frame(width: 30.11, height: 31.98)
            .offset(x: moveRight ? offsetAmount : -offsetAmount)
            .animation(
                Animation.easeInOut(duration: 8)
                    .repeatForever(autoreverses: true)
                    .delay(delay),
                value: moveRight
            )
    }

    private func startAnimations() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                Animation.easeInOut(duration: 8)
                    .repeatForever(autoreverses: true)
            ) {
                moveRight.toggle()
            }
        }
    }
}

extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: 1
        )
    }
}

#Preview {
    Birds()
}
