//
//  GameController.swift
//  SceneKitSwift-Shooter
//
//  Created by Pedro Brandão on 07/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import SceneKit
import GameplayKit

enum PhysicsCategory: Int {
    case none = 0,
    player,
    enemy
}

class GameController: NSObject, SCNSceneRendererDelegate {
    
    static let sharedGameController = GameController()
    
    let scene = MainScene(named: MainScene.fileName)!
    let playerEntity: PlayerEntity
    let agentSystem = GKComponentSystem.init(componentClass: GKAgent2D.self)
    let trackingAgent = GKAgent2D()
    let stopGoal = GKGoal.init(toReachTargetSpeed: 0)
    var lastUpdate: TimeInterval = 0
    var seekGoal: GKGoal
    
    var seeking: Bool = false {
        willSet(newValue) {
            if newValue == true {
                self.playerEntity.agentComponent().agent.behavior?.setWeight(1, for: self.seekGoal)
                self.playerEntity.agentComponent().agent.behavior?.setWeight(0, for: self.stopGoal)
            } else {
                self.playerEntity.agentComponent().agent.behavior?.setWeight(0, for: self.seekGoal)
                self.playerEntity.agentComponent().agent.behavior?.setWeight(1, for: self.stopGoal)
            }
        }
    }
    
    override init() {
        trackingAgent.position = vector2(0.0, 0.0)
        trackingAgent.radius = Float(1.0)
        
        playerEntity = PlayerEntity(scene: scene, andTracking: trackingAgent)
        playerEntity.agentComponent().agent.behavior = GKBehavior()
        agentSystem.addComponent(playerEntity.agentComponent().agent)
        
        seekGoal = GKGoal.init(toSeekAgent: trackingAgent)
    }
    
    func handleTouches(_ touches: Set<UITouch>, inView view:SCNView) {
        let touch: UITouch = touches.first!
        let location = touch.location(in: view)
        let hitResults = view.hitTest(location, options: nil)
        
        if hitResults.count > 0 {
            let shapeEntity = hitResults.first
            if shapeEntity?.node.name == "planeFloor" {
                let position = (shapeEntity?.localCoordinates)!
                trackingAgent.position = vector2(position.x, -position.y)
            }
        }
    }
 
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if lastUpdate == 0 {
            lastUpdate = time
        }
        
        let delta: TimeInterval = time - lastUpdate
        lastUpdate = time
        agentSystem.update(deltaTime: delta)
    }
 
}
