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
    case None = 0,
    Player,
    Enemy
}

class GameController: NSObject, SCNSceneRendererDelegate {
    
    static let sharedGameController = GameController()
    
    let scene = MainScene(named: MainScene.fileName)!
    let playerEntity: PlayerEntity
    let agentSystem = GKComponentSystem.init(componentClass: GKAgent2D.self)
    let trackingAgent = GKAgent2D()
    let stopGoal = GKGoal.init(toReachTargetSpeed: 0)
    var lastUpdate: NSTimeInterval = 0
    var seekGoal: GKGoal
    
    var seeking: Bool = false {
        willSet(newValue) {
            if newValue == true {
                self.playerEntity.agentComponent().agent.behavior?.setWeight(1, forGoal: self.seekGoal)
                self.playerEntity.agentComponent().agent.behavior?.setWeight(0, forGoal: self.stopGoal)
            } else {
                self.playerEntity.agentComponent().agent.behavior?.setWeight(0, forGoal: self.seekGoal)
                self.playerEntity.agentComponent().agent.behavior?.setWeight(1, forGoal: self.stopGoal)
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
    
    func handleTouches(touches: Set<UITouch>, inView view:SCNView) {
        let touch: UITouch = touches.first!
        let location = touch.locationInView(view)
        let hitResults = view.hitTest(location, options: nil)
        
        if hitResults.count > 0 {
            let shapeEntity = hitResults.first
            if shapeEntity?.node.name == "planeFloor" {
                let position = (shapeEntity?.localCoordinates)!
                trackingAgent.position = vector2(position.x, -position.y)
            }
        }
    }
 
    func renderer(renderer: SCNSceneRenderer, updateAtTime time: NSTimeInterval) {
        if lastUpdate == 0 {
            lastUpdate = time
        }
        
        let delta: NSTimeInterval = time - lastUpdate
        lastUpdate = time
        agentSystem.updateWithDeltaTime(delta)
    }
 
}
