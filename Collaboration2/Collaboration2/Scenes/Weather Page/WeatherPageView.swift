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
        SpriteView(scene: RainFail(), options: [.allowsTransparency])
    }
    
    init(viewModel: WeatherPageViewModel) {
        self.viewModel = viewModel
    }
}

class RainFail: SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 1 , y: 1)
        
        backgroundColor = .clear
        
        let node = SKEmitterNode(fileNamed: "RainFall.sks")!
        
        addChild(node)
        node.position = CGPoint(x: 1, y: 1)
    }
}


#Preview {
    WeatherPageView(viewModel: WeatherPageViewModel())
}
