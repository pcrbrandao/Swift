//
//  GameController.swift
//  RogueLike-Swift
//
//  Created by Pedro Brandão on 19/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

enum PhysicsCategory: UInt32 {
    case none = 0,
    player,
    enemy
}

class GameController: NSObject {
    
    static let sharedController = GameController()
    
    static func startAnimationWith(atlasName: String, spriteNode: SKSpriteNode, timeFrame: TimeInterval) {
        let atlas = SKTextureAtlas(named: atlasName)
        var frames = [SKTexture]()
        
        let numImages = atlas.textureNames.count
        print("numImages.count..........: \(numImages)")
        
        for i in 1...numImages {
            let stringNumber = String(format: "%02d", i)
            let textureName = "\(atlasName)\(stringNumber)"
            print("textureName........: \(textureName)")
            frames.append(atlas.textureNamed(textureName))
        }
        
        let action = SKAction.animate(with: frames, timePerFrame: timeFrame)
        spriteNode.run(SKAction.repeatForever(action))
    }

}
