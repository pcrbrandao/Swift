//
//  StartMenu.swift
//  RogueLike-Swift
//
//  Created by Pedro Brandão on 03/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import SpriteKit

class StartMenu: SKScene {
    
    override func didMove(to view: SKView) {
        
        /* Setup your scene here */
         
         let myLabel = SKLabelNode(fontNamed:"Chalkduster")
         myLabel.text = "Hello, Start Menu!"
         myLabel.fontSize = 45
         myLabel.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
         
         self.addChild(myLabel)
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
