//
//  Controller.swift
//  MySpaceInvader
//
//  Created by Pedro Brandão on 26/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import SpriteKit

class Controller: NSObject {
    
    static let sharedController = Controller()
    
    private var view: SKView?
    private var mainScene: GameScene?
    
    func play(withView view: SKView) {
        
        self.view = view
        
        // Load the SKScene from 'GameScene.sks'
        if let scene = GameScene(fileNamed: "GameScene") {
            // Set the scale mode to scale to fit the window
            mainScene = scene
            mainScene.scaleMode = .aspectFill
            
            // Present the scene
            self.view.presentScene(mainScene)
        }
        
        self.view.ignoresSiblingOrder = true
        
        self.view.showsFPS = true
        self.view.showsNodeCount = true
    }
}
