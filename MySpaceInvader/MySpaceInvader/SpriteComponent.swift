//
//  SpriteComponent.swift
//  MySpaceInvader
//
//  Created by Pedro Brandão on 26/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import GameplayKit
import SpriteKit

class SpriteComponent: GKComponent {
    
    let node: SKSpriteNode
    
    init(withNode spriteNode:SKSpriteNode) {
        node = spriteNode
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
