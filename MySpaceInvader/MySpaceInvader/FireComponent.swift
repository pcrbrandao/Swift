//
//  FireComponent.swift
//  MySpaceInvader
//
//  Created by Pedro Brandão on 27/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import GameplayKit

class FireComponent: GKComponent {
    
    func fireBullet(withController controller:Controller) {
        
        let bullet = SKSpriteNode(imageNamed: SpriteNodes.kBULLET)
        bullet.setScale(0.5)
        bullet.zPosition = 1
        
        if let playerSprite = self.entity?.component(ofType: SpriteComponent.self) {
            bullet.position = playerSprite.node.position
        }
        controller.mainScene?.addChild(bullet)
        let sceneTop = (controller.mainScene?.size.height)! + bullet.size.height
        
        let moveBullet = SKAction.moveTo(y:sceneTop, duration: 1)
        let deleteBullet = SKAction.removeFromParent()
        let bulletSound = controller.mainScene?.bulletSound
        let bulletSequence = SKAction.sequence([bulletSound!, moveBullet, deleteBullet])
        bullet.run(bulletSequence)
    }

}
