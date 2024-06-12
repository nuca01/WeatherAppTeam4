//  CloudAnimationView.swift
//  Collaboration2
//
//  Created by Akaki Titberidze on 12.06.24.
//

import SwiftUI

struct CloudAnimationView: View {
    @State private var clouds: [Cloud] = []
    var cloudSetHalf: Bool
    
    init(cloudSetHalf: Bool = false) {
        self.cloudSetHalf = cloudSetHalf
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(clouds.indices, id: \.self) { index in
                    let cloud = clouds[index]
                    let width = CGFloat.random(in: 50...140)
                    let size = CGSize(width: width, height: width * 0.6)
                    let imageName = Bool.random() ? "cloud1" : "cloud2"
                    CloudView(startingAt: cloud.position, duration: cloud.duration, screenSize: geometry.size, size: size, imageName: imageName, direction: cloud.direction)
                }
            }
            .onAppear {
                let numberOfClouds = cloudSetHalf ? 14 : 30
                let verticalRange: ClosedRange<CGFloat> = cloudSetHalf ? 0...(geometry.size.height / 3) : 0...geometry.size.height
                clouds = (0..<numberOfClouds).map { _ in
                    let direction: Cloud.Direction = Bool.random() ? .leftToRight : .rightToLeft
                    let xPosition: CGFloat = direction == .leftToRight ? -CGFloat.random(in: 0...geometry.size.width / 2) : CGFloat.random(in: geometry.size.width...geometry.size.width * 1.5)
                    return Cloud(position: CGPoint(x: xPosition, y: CGFloat.random(in: verticalRange)), duration: Double.random(in: 10...20), direction: direction)
                }
            }
        }
    }
}

struct CloudView: View {
    @State private var position: CGPoint
    @State private var opacity: Double = 1.0
    private let duration: Double
    private let screenSize: CGSize
    private let size: CGSize
    private let imageName: String
    private let direction: Cloud.Direction
    
    init(startingAt position: CGPoint, duration: Double, screenSize: CGSize, size: CGSize, imageName: String, direction: Cloud.Direction) {
        self._position = State(initialValue: position)
        self.duration = duration
        self.screenSize = screenSize
        self.size = size
        self.imageName = imageName
        self.direction = direction
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: size.width, height: size.height)
            .position(position)
            .opacity(opacity)
            .onAppear {
                withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
                    if direction == .leftToRight {
                        position.x += screenSize.width * 1.5
                    } else {
                        position.x -= screenSize.width * 1.5
                    }
                    opacity = 0.0
                }
            }
    }
}

struct Cloud {
    enum Direction {
        case leftToRight
        case rightToLeft
    }
    
    var position: CGPoint
    var duration: Double
    var direction: Direction
}
