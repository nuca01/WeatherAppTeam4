//
//  Birds.swift
//  Collaboration2
//
//  Created by Giorgi Michitashvili on 6/12/24.
//

import SwiftUI

struct BirdsView: View {
    @State private var moveRight = false

    var body: some View {
        GeometryReader { geometry in
            HStack {
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
            .frame(maxWidth: .infinity, maxHeight: 200)
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
