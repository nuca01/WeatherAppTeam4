//
//  SpriteAnimationView.swift
//  Collaboration2
//
//  Created by vano Kvakhadze on 12.06.24.
//

import SwiftUI
import SpriteKit

class SpriteAnimationView: SKScene {
    private var anchorX: CGFloat
    private var anchorY: CGFloat
    private var fileName: String
    
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: anchorX , y: anchorY)
        
        backgroundColor = .clear
        
        
        if let node = SKEmitterNode(fileNamed: fileName){
            addChild(node)
            node.particlePositionRange.dx = UIScreen.main.bounds.maxX
            node.particlePositionRange.dy = UIScreen.main.bounds.height
        }
    }
    
    init(anchorX: CGFloat, anchorY: CGFloat, fileName: String) {
        self.anchorX = anchorX
        self.anchorY = anchorY
        self.fileName = fileName
        
        super.init(size: UIScreen.main.bounds.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
