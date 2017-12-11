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
    
    let redButton: SKSpriteNode = SKSpriteNode(imageNamed: "RedButton")
    let timerLabel: SKLabelNode = SKLabelNode(fontNamed: "Menlo")
    let pressTheButtonLabel: SKLabelNode = SKLabelNode(fontNamed: "Menlo")
    var timeLeft: CGFloat = 1.0
    var timer = Timer()
    var isTimeRunning = false
    override func didMove(to view: SKView) {
        setupAllNodes()
        
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let touchedLocation = touch.location(in: self)
            let touchedNode = self.atPoint(touchedLocation)
            
            if touchedNode.name == "RedButton" {
                print("Red Button has been touched")
                if isTimeRunning == false {
                    runTimer()
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        updateTimerLabel()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimeRunning = true
    }
    
    func updateTimerLabel() {
        timerLabel.text = "\(timeLeft)"
    }
    
    @objc func updateTimer(){
        timeLeft = timeLeft - 1
        if timeLeft < 0 {
            timeLeft = 0
            timer.invalidate()
            
        }
    }
    
    func setupAllNodes() {
        setupSpriteNode(spriteNode: redButton, position: CGPoint(x: self.size.width / 2, y: self.size.height / 2), anchorPoint: CGPoint(x: 0.5, y: 0.5), zPosition : 10, scale: 0.5, name : "RedButton")
        setupLabelNode(labelNode: timerLabel, text: "Time: \(timeLeft)", fontColor: SKColor.white, fontSize: 75, zPosition: 10, horizontalAlignmentMode: .center, verticalAlignmentMode: .center, position: CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.25))
        setupLabelNode(labelNode: pressTheButtonLabel, text: "Press the Button", fontColor: SKColor.white, fontSize: 75, zPosition: 10, horizontalAlignmentMode: .center, verticalAlignmentMode: .center, position: CGPoint(x: self.size.width / 2, y: self.size.height * 0.75))
        
        
    }
    
    func setupSpriteNode(spriteNode _spriteNode: SKSpriteNode, position _position: CGPoint, anchorPoint _anchorPoint: CGPoint, zPosition _zPosition: CGFloat, scale _scale: CGFloat, name _name: String) {
        _spriteNode.position = _position
        _spriteNode.anchorPoint = _anchorPoint
        _spriteNode.zPosition = _zPosition
        _spriteNode.setScale(_scale)
        _spriteNode.name = _name
        addChild(_spriteNode)
        
    }
    
    func setupLabelNode(labelNode _labelNode: SKLabelNode, text _text: String, fontColor _fontColor: SKColor, fontSize _fontSize: CGFloat, zPosition _zPosition: CGFloat, horizontalAlignmentMode _horizontalAlignmentMode: SKLabelHorizontalAlignmentMode, verticalAlignmentMode _verticalAlignmentMode: SKLabelVerticalAlignmentMode, position _position: CGPoint) {
        _labelNode.text = _text
        _labelNode.fontColor = _fontColor
        _labelNode.fontSize = _fontSize
        _labelNode.zPosition = _zPosition
        _labelNode.horizontalAlignmentMode = _horizontalAlignmentMode
        _labelNode.verticalAlignmentMode = _verticalAlignmentMode
        _labelNode.position = _position
        addChild(_labelNode)
        
    }
}
