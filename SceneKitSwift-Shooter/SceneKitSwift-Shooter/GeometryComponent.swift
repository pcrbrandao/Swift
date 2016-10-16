//
//  GeometryComponent.swift
//  SceneKitSwift-Shooter
//
//  Created by Pedro Brandão on 21/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import GameplayKit
import SceneKit

class GeometryComponent: GKComponent {
    
    let node: SCNNode
    
    init(withNode scnNode: SCNNode) {
        node = scnNode
        // node.physicsBody?.categoryBitMask = PhysicsCategory.Player.rawValue
        // node.physicsBody?.collisionBitMask = PhysicsCategory.None.rawValue
        // node.physicsBody?.contactTestBitMask = PhysicsCategory.Enemy.rawValue
    }

}
