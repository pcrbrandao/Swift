//
//  Castle.swift
//  MonsterWars
//
//  Created by Pedro Brandão on 19/11/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

class Castle: GKEntity {
    
    init(withFileName imageName: String, andTeam team:Team) {
        super.init()
        
        let spriteComponent = SpriteComponent(withTexture: SKTexture(imageNamed: imageName))
        addComponent(spriteComponent)
        addComponent(TeamComponent(withTeam: team))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
