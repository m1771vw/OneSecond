//
//  GameScene.swift
//  OneSecond
//
//  Created by William Yang on 12/9/17.
//  Copyright © 2017 S(h)itty Games. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let redButton = SKSpriteNode(imageNamed: "RedButton")
    
    
    override func didMove(to view: SKView) {
        setupSpriteNodes()
        
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func setupSpriteNodes() {
        setupSpriteNode(spriteNode: redButton, position: CGPoint(x: self.size.width / 2, y: self.size.height / 2), anchorPoint: CGPoint(x: 0.5, y: 0.5), zPosition : 10, name : "RedButton")
    }
    
    func setupSpriteNode(spriteNode _spriteNode: SKSpriteNode, position _position: CGPoint, anchorPoint _anchorPoint: CGPoint, zPosition _zPosition: CGFloat, name _name: String) {
        _spriteNode.position = _position
        _spriteNode.anchorPoint = _anchorPoint
        _spriteNode.zPosition = _zPosition
        _spriteNode.name = _name
        addChild(_spriteNode)
        
    }
}
