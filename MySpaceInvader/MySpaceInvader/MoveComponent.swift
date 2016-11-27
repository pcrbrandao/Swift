//
//  MoveComponent.swift
//  MySpaceInvader
//
//  Created by Pedro Brandão on 27/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import GameplayKit
import SpriteKit
import UIKit

class MoveComponent: GKComponent {
    
    func move(withTouches touches:Set<UITouch>, andController controller:Controller) {
        
        for touch in touches {
            
            let pointOfTouch = touch.location(in: controller.mainScene!)
            let previousPointOfTouch = touch.previousLocation(in: controller.mainScene!)
            
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            
            if let sprite = self.entity?.component(ofType: SpriteComponent.self) {
                sprite.node.position.x += amountDragged
            }
        }
    }

}
