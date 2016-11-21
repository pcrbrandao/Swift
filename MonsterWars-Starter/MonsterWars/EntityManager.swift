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
    }
    
    /**
     * brief: Remove a entidade da lista e da scene
     */
    func remove(entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        entities.remove(entity)
    }
}
