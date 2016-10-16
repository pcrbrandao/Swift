//
//  SpriteComponent.swift
//  RogueLike-Swift
//
//  Created by Pedro Brandão on 19/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

class SpriteComponent: GKComponent {
    
    var sprite: SKSpriteNode
    
    init(withNode spriteNode: SKSpriteNode) {
        
        sprite = spriteNode
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
