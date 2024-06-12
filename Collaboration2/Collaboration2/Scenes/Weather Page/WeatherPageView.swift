//
//  WeatherPageView.swift
//  Collaboration2
//
//  Created by nuca on 11.06.24.
//

import SwiftUI
import SpriteKit

struct WeatherPageView: View {
    @ObservedObject var viewModel: WeatherPageViewModel
    @State var city: City?
    
    var body: some View {
        ZStack{
            Text("Hello, World!")
        }
        SpriteView(scene: Stars(), options: [.allowsTransparency])
    }
    
    init(viewModel: WeatherPageViewModel) {
        self.viewModel = viewModel
    }
}

class Stars: SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        
        backgroundColor = .clear
        
        let node = SKEmitterNode(fileNamed: "Stars.sks")!
        
        addChild(node)
        node.particlePositionRange.dx = UIScreen.main.bounds.maxX
    }
}


#Preview {
    WeatherPageView(viewModel: WeatherPageViewModel())
}
