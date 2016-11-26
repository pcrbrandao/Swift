//
//  GameScene.swift
//  MySpaceInvader
//
//  Created by Pedro Brandão on 25/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 * @discussion Os nodes são configurados no editor no arquivo GameScene.sks. Os nodes já fazem parte da scene e não precisam ser adicionados (?) . Aqui apenas são instanciados para configurações adicionais e/ou manipulações
 */
class GameScene: SKScene {
    
    private var stars: SKSpriteNode?
    private var player: SKSpriteNode?
    /** Código de Exemplo
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
     */
    
    override func didMove(to view: SKView) {
        
        stars = self.childNode(withName: SpriteNodes.kSTARS) as? SKSpriteNode
        stars?.size = self.size
        // self.background?.zPosition = 0 // esse é a camada (layer)
        
        player = self.childNode(withName: SpriteNodes.kPLAYER) as? SKSpriteNode
        let playerPositionY = -((self.size.height / 2) - ((player?.size.height)! * 1.1))
        player?.position = CGPoint(x: 0, y: playerPositionY)
        
        
        
        /** Código de exemplo
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
         */
    }
    
    /** Código de exemplo
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
     */
}
