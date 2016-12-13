//
//  SpriteComponent.swift
//  MonsterWars
//
//  Created by Pedro Brandão on 19/11/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

class SpriteComponent: GKComponent {
    
    let node: SKSpriteNode
    
    init(withTexture texture: SKTexture) {
        node = SKSpriteNode(texture: texture, color: SKColor.white, size: texture.size())
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
