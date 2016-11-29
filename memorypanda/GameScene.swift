//
//  GameScene.swift
//  memorypanda
//
//  Created by Robbie Santos on 11/28/16.
//  Copyright (c) 2016 Robbie Santos. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var buttonPlay : SKSpriteNode!
    var buttonLeaderboard : SKSpriteNode!
    var buttonRate : SKSpriteNode!
    var title : SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        setupScenery()
        
        CreateMenu()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
//        let touchLocation = touch.locationInNode(self)
        
        var positionInScene : CGPoint = touch.locationInNode(self)
        var touchedNode : SKSpriteNode = self.nodeAtPoint(positionInScene) as! SKSpriteNode
        
        self.ProcessItemTouch(touchedNode)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func setupScenery(){
        let background = SKSpriteNode(imageNamed: BackgroundImage)
        background.anchorPoint = CGPointMake(0, 1)
        background.position = CGPointMake(0, size.height)
        background.zPosition = 0
        background.size = CGSize(width: self.view!.bounds.size.width, height: self.view!.bounds.size.height)
        addChild(background)
    }
    
    func CreateMenu(){
        var offsetY : CGFloat = 3.0
        var offsetX : CGFloat = 5.0
        buttonRate = SKSpriteNode(imageNamed: buttonRateImage)
        buttonRate.position = CGPointMake(size.width/2, size.height/2 + buttonRate.size.height + offsetY)
        buttonRate.zPosition = 10
        buttonRate.name = "rate"
        addChild(buttonRate)
        
        buttonPlay = SKSpriteNode(imageNamed: buttonPlayImage)
        buttonPlay.position = CGPointMake(size.width / 2 - offsetX - buttonPlay.size.width / 2 , size.height/2)
        buttonPlay.zPosition = 10
        buttonPlay.name = "play"
        addChild(buttonPlay)
        
        buttonLeaderboard = SKSpriteNode(imageNamed: buttonLeaderboardImage)
        buttonLeaderboard.position = CGPointMake(size.width / 2 + offsetX + buttonLeaderboard.size.width / 2, size.height / 2)
        buttonLeaderboard.zPosition = 10
        buttonLeaderboard.name = "leaderboard"
        addChild(buttonLeaderboard)
        
        title = SKSpriteNode(imageNamed: titleImage)
        title.position = CGPointMake(size.width / 2, buttonRate.position.y + buttonRate.size.height / 2 + title.size.height / 2 + offsetY)
        title.zPosition = 10
        title.name = "title"
        addChild(title)
        title.setScale(1)
    }
    
    func ProcessItemTouch(nod : SKSpriteNode){
        if(nod.name == "play") {
            println("play button pressed")
        }
        else if (nod.name == "leaderboard") {
            println("leaderboard button pressed")
        }
        else if (nod.name == "rate") {
            println("rate button pressed")
        }
    }
}