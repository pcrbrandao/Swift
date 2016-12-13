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
    
    init(team: Team, entityManager:EntityManager) {
        super.init()
        let texture = SKTexture(imageNamed: "quirk\(team.rawValue)")
        let spriteComponent = SpriteComponent(withTexture: texture)
        addComponent(spriteComponent)
        addComponent(TeamComponent(withTeam: team))
        addComponent(MoveComponent(maxSpeed: 150, maxAcceleration: 5, radius:Float(texture.size().width * 0.3), entityManager: entityManager))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
