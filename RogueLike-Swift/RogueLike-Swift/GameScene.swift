//
//  GameScene.swift
//  RogueLike-Swift
//
//  Created by Pedro Brandão on 08/09/16.
//  Copyright (c) 2016 Pedro Brandão. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        /* Setup your scene here
         
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
         
         */
    
        let centerPoint = CGPoint.init(x: self.size.width/2, y: self.size.height/2)
        let player = PlayerEntity(withPosition: centerPoint)
        let playerSpriteNode = player.component(ofType: SpriteComponent.self)
        let playerState = player.component(ofType: StateComponent.self)?.stateMachine
        
        self.addChild((playerSpriteNode?.sprite)!)
        playerState?.enter(IdleState.self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
       /* Called when a touch begins
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
         
         */
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
   
    // deixar para o delegate
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered
        if lastUpdateTime == 0 {
            lastUpdateTime = currentTime
        }
        let delta = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        agentSystem.updateWithDeltaTime(delta) */
    }
}
