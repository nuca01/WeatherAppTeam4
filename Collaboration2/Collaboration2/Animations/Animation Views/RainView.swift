//
//  RainView.swift
//  Collaboration2
//
//  Created by vano Kvakhadze on 12.06.24.
//

import SwiftUI
import SpriteKit

class RainView: SKScene {
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 1 , y: 1)
        
        backgroundColor = .clear
        
        
        if let node = SKEmitterNode(fileNamed: "RainFall.sks"){
            addChild(node)
            node.position = CGPoint(x: 0.5, y: 0.5)
        }
    }
}
