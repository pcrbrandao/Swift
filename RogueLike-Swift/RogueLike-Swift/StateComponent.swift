//
//  StateComponent.swift
//  RogueLike-Swift
//
//  Created by Pedro Brandão on 15/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import GameplayKit

class StateComponent: GKComponent {
    
    let stateMachine: GKStateMachine
    
    init(withNode spriteNode: SKSpriteNode) {
        
        let idleState = IdleState(WithNode: spriteNode)
        stateMachine = GKStateMachine.init(states: [idleState])
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
