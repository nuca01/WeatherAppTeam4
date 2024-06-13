//
//  RainAnimationView.swift
//  Collaboration2
//
//  Created by Akaki Titberidze on 12.06.24.
//

import SwiftUI

struct RainAnimationView: View {
    @State private var raindrops: [CGPoint] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(raindrops.indices, id: \.self) { index in
                    let drop = raindrops[index]
                    RaindropView(startingAt: drop, duration: Double.random(in: 2...6), screenSize: geometry.size)
                }
            }
            .onAppear {
                let numberOfDrops = 100
                raindrops = (0..<numberOfDrops).map { _ in
                    CGPoint(x: CGFloat.random(in: geometry.size.width...geometry.size.width * 2), y: CGFloat.random(in: -geometry.size.height...0))
                }
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.linearRainTopDay, .linearRainBottomDay]), startPoint: .top, endPoint: .bottom)
        )
    }
}


struct RaindropView: View {
    @State private var position: CGPoint
    @State private var opacity: Double = 1.0
    private let duration: Double
    private let screenSize: CGSize
    
    init(startingAt position: CGPoint, duration: Double, screenSize: CGSize) {
        self._position = State(initialValue: position)
        self.duration = duration
        self.screenSize = screenSize
    }
    
    var body: some View {
        Image("rain")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 35)
            .foregroundColor(.blue)
            .position(position)
            .opacity(opacity)
            .onAppear {
                withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
                    position.x -= screenSize.width * 2
                    position.y += screenSize.height * 2
                    opacity = 0.0
                }
            }
    }
}

