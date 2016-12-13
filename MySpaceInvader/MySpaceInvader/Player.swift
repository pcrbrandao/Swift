//
//  Controller.swift
//  MySpaceInvader
//
//  Created by Pedro Brandão on 26/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import GameplayKit

class Player: GKEntity {
    
    init(withNode node:SKSpriteNode) {
        
        super.init()
        
        addComponent(SpriteComponent(withNode: node))
        addComponent(FireComponent())
        addComponent(MoveComponent())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
