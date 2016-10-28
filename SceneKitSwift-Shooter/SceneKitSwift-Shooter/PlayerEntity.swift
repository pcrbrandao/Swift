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
        
        let node = scene.rootNode.childNode(withName: "player", recursively: false)!
        node.physicsBody?.categoryBitMask = PhysicsCategory.player.rawValue
        node.physicsBody?.collisionBitMask = PhysicsCategory.none.rawValue
        node.physicsBody?.contactTestBitMask = PhysicsCategory.enemy.rawValue
        
        super.init()
        
        self.addComponent(AgentComponent(withNode: node, andTracking: tracking))
        self.addComponent(GeometryComponent(withNode: node))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func agentComponent() -> AgentComponent {
        return self.component(ofType: AgentComponent.self)!
    }
    
    func geometryComponent() -> GeometryComponent {
        return self.component(ofType: GeometryComponent.self)!
    }
}
