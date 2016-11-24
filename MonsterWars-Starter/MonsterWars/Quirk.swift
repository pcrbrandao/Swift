//
//  Quirk.swift
//  MonsterWars
//
//  Created by Pedro Brandão on 22/11/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

class Quirk: GKEntity {
    
    init(team: Team) {
        super.init()
        let texture = SKTexture(imageNamed: "quirk\(team.rawValue)")
        let spriteComponent = SpriteComponent(withTexture: texture)
        addComponent(spriteComponent)
        addComponent(TeamComponent(withTeam: team))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
