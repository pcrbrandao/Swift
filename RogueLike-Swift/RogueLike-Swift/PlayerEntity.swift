//
//  PlayerEntity.swift
//  RogueLike-Swift
//
//  Created by Pedro Brandão on 19/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

class PlayerEntity: GKEntity {
    
    var position = CGPoint(x: 0, y: 0)
    
    override init() {
        super.init()
    }
    
    init(withPosition position: CGPoint) {
        
        self.position = position
        let atlas = SKTextureAtlas(named: "sorlo-idle")
        print("atlas sorlo contem......: \(atlas.textureNames.count) imagens")
        print("a primeira imagem é......: \(atlas.textureNames.first)")
        let playerNode = SKSpriteNode(texture: atlas.textureNamed("sorlo-idle01"))

        super.init()
        playerNode.position = position
        playerNode.setScale(1)
        playerNode.physicsBody = SKPhysicsBody.init(rectangleOf: playerNode.size)
        playerNode.physicsBody?.affectedByGravity = false
        playerNode.physicsBody?.categoryBitMask = PhysicsCategory.player.rawValue
        playerNode.physicsBody?.collisionBitMask = PhysicsCategory.none.rawValue
        playerNode.physicsBody?.contactTestBitMask = PhysicsCategory.enemy.rawValue
        
        self.addComponent(SpriteComponent(withNode: playerNode))
        self.addComponent(StateComponent(withNode: playerNode))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
