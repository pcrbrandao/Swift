//
//  PlayerEntity.swift
//  SceneKitSwift-Shooter
//
//  Created by Pedro Brandão on 07/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import SceneKit
import GameplayKit

class PlayerEntity: GKEntity {
    
    init(scene: SCNScene, andTracking tracking: GKAgent2D) {
        
        let node = scene.rootNode.childNodeWithName("player", recursively: false)!
        node.physicsBody?.categoryBitMask = PhysicsCategory.Player.rawValue
        node.physicsBody?.collisionBitMask = PhysicsCategory.None.rawValue
        node.physicsBody?.contactTestBitMask = PhysicsCategory.Enemy.rawValue
        
        super.init()
        
        self.addComponent(AgentComponent(withNode: node, andTracking: tracking))
        self.addComponent(GeometryComponent(withNode: node))
    }
    
    func agentComponent() -> AgentComponent {
        return self.componentForClass(AgentComponent.self)!
    }
    
    func geometryComponent() -> GeometryComponent {
        return self.componentForClass(GeometryComponent.self)!
    }
}
