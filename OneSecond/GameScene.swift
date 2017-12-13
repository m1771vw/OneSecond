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
    let restartButton: SKSpriteNode = SKSpriteNode(imageNamed: "RedButton")
    let timerLabel: SKLabelNode = SKLabelNode(fontNamed: "Menlo")
    let pressTheButtonLabel: SKLabelNode = SKLabelNode(fontNamed: "Menlo")
    let totalScoreLabel: SKLabelNode = SKLabelNode(fontNamed: "Menlo")
    
    // Time Stuff
    var startTime = TimeInterval()
    let originalTime: CGFloat = 0.0
    lazy var timeLeft: CGFloat = self.originalTime
    // Adding more time stuff
    var seconds: TimeInterval = 0.0
    
    var totalScore: CGFloat = 0
    var timer = Timer()
    var stringTimer = ""
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
                } else {
                    restartTimer()
                }
                if seconds > 1.01 {
                    print("Too late!!: \(seconds)")
                } else if(seconds > 0.999 && seconds < 1.001) {
                    print("RIGHT ON!!: \(seconds)")
                } else if seconds < 0.99 {
                    
                    print("Too early: \(seconds)")
                }
                if timeLeft > 1.0 {
                    totalScore += 1
                }
            }
            
            if touchedNode.name == "RestartButton" {
                print("Restart Button has been touched")
                restartTimer()
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
//        updateTextLabel(labelNode: timerLabel, updateText: "Time: \(timeLeft)")
        updateTextLabel(labelNode: timerLabel, updateText: "Time: \(stringTimer)")
        updateTextLabel(labelNode: totalScoreLabel, updateText: "Total score: \(totalScore)")
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        startTime = Date.timeIntervalSinceReferenceDate
        isTimeRunning = true
    }
    
    func restartTimer() {
        timer.invalidate()
        isTimeRunning = false
        timeLeft = originalTime
    }
    
    func updateTextLabel(labelNode _labelNode: SKLabelNode, updateText _updateText: String){
        _labelNode.text = _updateText
    }
    
    @objc func updateTimer(){
        let currentTime = Date.timeIntervalSinceReferenceDate
        //print("Current Time: " + String(currentTime))
        //Find the difference between current time and start time.
        var elapsedTime: TimeInterval = currentTime - startTime
       // print("ELasped Time: " + String(elapsedTime))
        //calculate the seconds in elapsed time.
        seconds = elapsedTime
        elapsedTime -= TimeInterval(seconds)
       // print("Seconds: " + String(seconds))
        //find out the fraction of milliseconds to be displayed.
        //let fraction = (elapsedTime * 100)
        //print("Fraction: " + String(fraction))
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strSeconds = String(format: "%.02f", seconds)
//        let strFraction = String(format: "%02d", fraction)
//        let strFraction = String(format: "%.02f", fraction)
        stringTimer = strSeconds
        
        //print("StrSeconds: " + strSeconds)
        
//        print("StrFraction: " + strFraction)
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
//        print("\(strSeconds):\(strFraction)")
        timerLabel.text = "\(strSeconds)"
    }
    
    func setupAllNodes() {
        setupSpriteNode(spriteNode: redButton, position: CGPoint(x: self.size.width / 2, y: self.size.height / 2), anchorPoint: CGPoint(x: 0.5, y: 0.5), zPosition : 10, scale: 0.5, name : "RedButton")
        setupSpriteNode(spriteNode: restartButton, position: CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.85), anchorPoint: CGPoint(x: 0.5, y: 0.5), zPosition: 10, scale: 0.10, name: "RestartButton")
        setupLabelNode(labelNode: timerLabel, text: "Time: \(timeLeft)", fontColor: SKColor.white, fontSize: 75, zPosition: 10, horizontalAlignmentMode: .center, verticalAlignmentMode: .center, position: CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.25))
        setupLabelNode(labelNode: pressTheButtonLabel, text: "Press the Button", fontColor: SKColor.white, fontSize: 75, zPosition: 10, horizontalAlignmentMode: .center, verticalAlignmentMode: .center, position: CGPoint(x: self.size.width / 2, y: self.size.height * 0.75))
        setupLabelNode(labelNode: totalScoreLabel, text: "Total Score: \(totalScore)", fontColor: SKColor.white, fontSize: 75, zPosition: 10, horizontalAlignmentMode: .center, verticalAlignmentMode: .center, position: CGPoint(x: self.size.width / 2, y: self.size.height * 0.10))
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
