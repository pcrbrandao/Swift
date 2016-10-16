//
//  IdleState.swift
//  RogueLike-Swift
//
//  Created by Pedro Brandão on 14/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

class IdleState: GKState {
    
    var spriteNode: SKSpriteNode
    
    init(WithNode node: SKSpriteNode) {
        spriteNode = node
    }
    
    override func didEnter(from previousState: GKState?) {
        GameController.startAnimationWith(atlasName: "sorlo-idle", spriteNode: spriteNode, timeFrame: 0.2)
    }

}
