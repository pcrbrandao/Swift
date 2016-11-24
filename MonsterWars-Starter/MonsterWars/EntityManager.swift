//
//  EntityManager.swift
//  MonsterWars
//
//  Created by Pedro Brandão on 19/11/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit
import Foundation
import SpriteKit
import GameplayKit

/**
 * @brief: Mantém uma lista com todas as entidades do jogo
 */
class EntityManager: NSObject {
    
    var entities = Set<GKEntity>()  // todas as entidades do jogo estarão aqui
    let scene: SKScene              // a cena onde estarão as entidades
    var toRemove = Set<GKEntity>()
    
    /**
     * @discussion Retorna todos os CastleComponents existentes
     */
    lazy var componentSystems: [GKComponentSystem] = {
        let castleSystem = GKComponentSystem(componentClass: CastleComponent.self)
        return [castleSystem]
    }()
    
    // Construtor
    init(comCena scene: SKScene) {
        self.scene = scene
    }
    
    /**
     * brief: Adiciona entidade na lista e o component na cena
     */
    func add(entity: GKEntity) {
        entities.insert(entity)
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        for componentSystem in componentSystems {
            componentSystem.addComponent(foundIn: entity)
        }
    }
    
    /**
     * brief: Remove a entidade da lista e da scene
     */
    func remove(entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        entities.remove(entity)
        toRemove.insert(entity)
    }
    
    /**
     * @discussion Faz um loop em todos os components, atualiza e/ou remove os que devem ser excluídos
     */
    func update(deltaTime seconds:TimeInterval) {
        
        for componentSystem in componentSystems {
            componentSystem.update(deltaTime: seconds)
        }
        
        for curRemove in toRemove {
            for componentSystem in componentSystems {
                componentSystem.removeComponent(foundIn: curRemove)
            }
        }
        toRemove.removeAll()
    }
    
    /**
     * @discussion Busca o castelo de um Team específico
     */
    func castleForTeam(team: Team) -> GKEntity? {
        for entity in entities {
            if let teamComponent = entity.component(ofType: TeamComponent.self),
                let _ = entity.component(ofType: CastleComponent.self) {
                if teamComponent.team == team {
                    return entity
                }
            }
        }
        return nil
    }
    
    /**
     * @discussion Lança um Quirk na scena
     */
    func spawnQuirk(team: Team) {
        // O Quirk deve ser lançado próximo ao castelo do seu time
        guard let teamEntity = castleForTeam(team: team),
            let teamCastleComponent = teamEntity.component(ofType: CastleComponent.self),
        let teamSpriteComponent = teamEntity.component(ofType: SpriteComponent.self) else {
            return
        }
        
        if teamCastleComponent.coins < costQuirk {
            return
        }
        teamCastleComponent.coins -= costQuirk
        scene.run(SoundManager.sharedInstance.soundSpawn)
        
        let monster = Quirk(team: team)
        if let spriteComponent = monster.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: teamSpriteComponent.node.position.x, y: CGFloat.random(min: scene.size.height * 0.25, max: scene.size.height * 0.75))
            spriteComponent.node.zPosition = 2
        }
        add(entity: monster)
    }
}
