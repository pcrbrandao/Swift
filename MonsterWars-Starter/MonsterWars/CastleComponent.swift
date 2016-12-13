//
//  CastleComponent.swift
//  MonsterWars
//
//  Created by Pedro Brandão on 22/11/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

class CastleComponent: GKComponent {
    
    var coins = 0
    var lastCoinDrop = TimeInterval(0)
    
    /**
     * @discussion Chamado em cada frame, mas deve ser configurado para ser chamado. As moedas são acrescentadas periodicamente.
     */
    override func update(deltaTime seconds: TimeInterval) {
        
        super.update(deltaTime: seconds)
        
        let coinDropInterval = TimeInterval(0.5)
        let coinsPerInterval = 10
        if (CACurrentMediaTime() - lastCoinDrop > coinDropInterval) {
            lastCoinDrop = CACurrentMediaTime()
            coins += coinsPerInterval
        }
    }
}
