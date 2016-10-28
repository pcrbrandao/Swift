//
//  AgentComponent.swift
//  SceneKitSwift-Shooter
//
//  Created by Pedro Brandão on 14/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import GameplayKit
import SceneKit

class AgentComponent: GKComponent, GKAgentDelegate {
    
    var node: SCNNode
    let agent = GKAgent2D()
    let tracking: GKAgent2D
    
    init(withNode node:SCNNode, andTracking tracking: GKAgent2D) {
        
        self.node = node
        self.tracking = tracking
        
        agent.radius = Float(10.0)
        agent.position = vector2(node.position.x, node.position.z)
        agent.maxSpeed = 10
        agent.maxAcceleration = 10
        agent.mass = 0.2
        
        super.init()
        
        agent.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: GKAgentDelegate
    
    func triangle(between point1:SCNVector3, ToPoint point2:vector_float2 ) -> (hipotenusa:Float, vetor: vector_float2, angle: Float) {
        let distX = Float(point2.x - point1.x)
        let distY = Float(point2.y - point1.z)
        
        let hipotenusa = hypotf(abs(distX), abs(distY))
        let vetor = vector2(distX, distY)
        let angle = atan2f(distY, distX)
        
        return (hipotenusa, vetor, angle)
    }
    
    func agentDidUpdate(_ agent: GKAgent) {
        
        let agent2D = agent as! GKAgent2D
        let distanceToTracking = triangle(between: node.position, ToPoint: tracking.position).hipotenusa
        
        if distanceToTracking > 0.5 {
            let angle = triangle(between: node.position, ToPoint: tracking.position).angle
            let agentPosition = SCNVector3.init(agent2D.position.x, 0.5, agent2D.position.y)
            
            agent2D.rotation = angle
            node.rotation = SCNVector4Make(tracking.position.x, 0.5, tracking.position.y, angle)
            node.position = agentPosition
        } else {
            if tracking.position.x != 0 && tracking.position.y != 0 {
                agent2D.position = vector2(node.position.x, node.position.z)
            }
        }
    }
    
    func agentWillUpdate(_ agent: GKAgent) {
        // nada aqui
    }
}
