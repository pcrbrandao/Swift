//
//  MoveBehavior.swift
//  MonsterWars
//
//  Created by Pedro Brandão on 24/11/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import GameplayKit
import SpriteKit

/**
 * @brief Contém uma lista de GKGoals que representam como os objetos de movem
 */
class MoveBehavior: GKBehavior {
    
    init(targetSpeed: Float, seek: GKAgent, avoid: [GKAgent]) {
        super.init()
        // se a velocidade < 0 não atribui nenhum goal assim o agent não se move
        if targetSpeed > 0 {
            // prioridade baixa para atingir a velocidade alvo
            setWeight(0.1, for: GKGoal(toReachTargetSpeed: targetSpeed))
            // prioridade média para mover-se em direção ao inimigo mais próximo
            setWeight(0.5, for: GKGoal(toSeekAgent: seek))
            // prioridade alta para manter-se afastado dos aliados
            setWeight(1.0, for: GKGoal(toAvoid: avoid, maxPredictionTime: 1.0))
        }
    }
}
