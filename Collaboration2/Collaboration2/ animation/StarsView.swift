//
//  Stars.swift
//  Collaboration2
//
//  Created by vano Kvakhadze on 12.06.24.
//

import SwiftUI
import SpriteKit

class StarsView: SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5 , y: 0.5)
        
        backgroundColor = .clear
        
        
        if let node = SKEmitterNode(fileNamed: "Stars.sks"){
            addChild(node)
            node.particlePositionRange.dx = UIScreen.main.bounds.maxX            
        }
    }
}
