//
//  MoveComponent.swift
//  MonsterWars
//
//  Created by Pedro Brandão on 24/11/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 * @brief GKAgent2D é um GKComponent que está customizado aqui
 */
class MoveComponent: GKAgent2D, GKAgentDelegate {
    
    // é preciso acessar outras entidades no jogo
    let entityManager: EntityManager
    
    // preciso acessar isso toda hora
    var spriteComponent: SpriteComponent? {
        get {
            if let spriteComponent = entity?.component(ofType: SpriteComponent.self) {
                return spriteComponent
            } else {
                return nil
            }
        }
    }
    
    /**
     * @brief: atribui uma massa bem pequena para que os objetos respondam à mudanças de direção mais facilmente
     */
    init(maxSpeed:Float, maxAcceleration:Float, radius:Float, entityManager:EntityManager) {
        self.entityManager = entityManager
        super.init()
        delegate = self
        self.maxSpeed = maxSpeed
        self.maxAcceleration = maxAcceleration
        self.radius = radius
        print(self.mass)
        self.mass = 0.01
    }
    
    // automático
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     * @discussion Antes de atualizar a posição do agente atribui-a com a posição do sprite
     */
    func agentWillUpdate(_ agent: GKAgent) {
        //guard let spriteComponent = entity?.component(ofType: SpriteComponent.self) else {
        //    return
        //}
        // se existir spriteComponent execute o código abaixo
        //position = float2(spriteComponent.node.position)
        if (spriteComponent != nil) {
          position = float2((spriteComponent?.node.position)!)
        }
    }
    
    /**
     * @discussion A posição do sprite é atualizada à do agente.
     */
    func agentDidUpdate(_ agent: GKAgent) {
        // guard let spriteComponent = entity?.component(ofType: SpriteComponent.self) else {
        //    return
        //}
        // se existir spriteComponent execute o código abaixo
        // spriteComponent.node.position = CGPoint(position)
        if (spriteComponent != nil) {
            spriteComponent?.node.position = CGPoint(position)
        }
    }
    
    /**
     * @discussion Encontra o moveComponent mais próximo de um Team
     */
    func closestMoveComponent(forTeam team:Team) -> GKAgent2D? {
        var closestMoveComponent: MoveComponent? = nil
        var closestDistance = CGFloat(0)
        
        let enemyMoveComponents = entityManager.moveComponentsForTeam(team: team)
        for enemyMoveComponent in enemyMoveComponents {
            let distance = (CGPoint(enemyMoveComponent.position) - CGPoint(position)).length()
            if closestMoveComponent == nil || distance < closestDistance {
                closestMoveComponent = enemyMoveComponent
                closestDistance = distance
            }
        }
        return closestMoveComponent
    }
    
    /**
     * @discussion Atribui o behavior para a entidade atual com base no componente mais próximo
     * e atualiza os componentes dos aliados para manter-se um pouco distante
     */
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        let teamComponent: TeamComponent? = self.entity!.component(ofType: TeamComponent.self)
        let enemyMoveComponent: GKAgent2D? = closestMoveComponent(forTeam: (teamComponent!.team.oppositeTean()))
        
        if teamComponent != nil && enemyMoveComponent != nil {
            let alliedMoveComponents = entityManager.moveComponentsForTeam(team: teamComponent!.team)
            behavior = MoveBehavior(targetSpeed: maxSpeed, seek: enemyMoveComponent!, avoid: alliedMoveComponents)
        }
    }
}
