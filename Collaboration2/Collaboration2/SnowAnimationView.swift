//  SnowAnimationView.swift
//  Collaboration2
//
//  Created by Akaki Titberidze on 12.06.24.
//
import SwiftUI

struct SnowflakeView: View {
    @State private var position: CGPoint
    @State private var opacity: Double = 1.0
    @State private var rotationAngle: Double = 0.0
    private let duration: Double
    private let screenSize: CGSize
    private let size: CGFloat
    
    init(startingAt position: CGPoint, duration: Double, screenSize: CGSize, size: CGFloat) {
        self._position = State(initialValue: position)
        self.duration = duration
        self.screenSize = screenSize
        self.size = size
    }
    
    var body: some View {
        Image("snowFlake")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .foregroundColor(.white)
            .rotationEffect(.degrees(rotationAngle))
            .position(position)
            .opacity(opacity)
            .onAppear {
                withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
                    position.y += screenSize.height * 1.5
                    opacity = 0.0
                }
                rotateSnowflake()
            }
    }
    
    private func rotateSnowflake() {
        let randomAngle = Double.random(in: -100...100)
        withAnimation(Animation.easeInOut(duration: Double.random(in: 2...4)).repeatForever(autoreverses: true)) {
            rotationAngle = randomAngle
        }
    }
}

struct SnowAnimationView: View {
    @State private var snowflakes: [CGPoint] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(snowflakes.indices, id: \.self) { index in
                    let flake = snowflakes[index]
                    let size = CGFloat.random(in: 20...50)
                    SnowflakeView(startingAt: flake, duration: Double.random(in: 4...8), screenSize: geometry.size, size: size)
                }
            }
            .onAppear {
                let numberOfFlakes = 60
                snowflakes = (0..<numberOfFlakes).map { _ in
                    CGPoint(x: CGFloat.random(in: 0...geometry.size.width), y: CGFloat.random(in: -geometry.size.height...0))
                }
            }
        }
    }
}
