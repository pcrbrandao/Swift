//
//  GameScene.swift
//  MonsterWars
//
//  Created by Main Account on 11/3/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Posicao na scene
    enum Posicao {
        case esquerda, direita
    }
    
    /**
     * acrescentei aqui
     */
    var entityManager: EntityManager!
    
    /**
     * até aqui
     */
    
    // MARK: Propriedades
    // Constants
    let margin = CGFloat(30)
    
    // Buttons
    var quirkButton: ButtonNode!
    var zapButton: ButtonNode!
    var munchButton: ButtonNode!
    
    // Labels
    let coin1Label = SKLabelNode(fontNamed: "Courier-Bold")
    let coin2Label = SKLabelNode(fontNamed: "Courier-Bold")
    
    // Update time
    var lastUpdateTimeInterval: TimeInterval = 0
    
    // Game over detection
    var gameOver = false

    
    // MARK: Métodos sobrescritos
    override func didMove(to view: SKView) {
        
        // acrescentei aqui
        // Os players e enemies devem ser adicionados à scene utilizando esse manager
        entityManager = EntityManager(comCena: self)
        
        print("scene size: \(size)")
        
        // Configura e adiciona sprites e entidades
        self.configBackground()
        self.configButtons()
        self.configCoins()
        self.adicionaEntidades()
    }
    
    // Impplementa o código quando ocorrerem os toques
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        print("\(touchLocation)")
        
        if gameOver {
            let newScene = GameScene(size: size)
            newScene.scaleMode = scaleMode
            view?.presentScene(newScene, transition: SKTransition.flipHorizontal(withDuration: 0.5))
            return
        }
    }
    
    // Implementa o código de atualização por intervalo de tempo
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        if gameOver {
            return
        }
        
        // acrescentei aqui
        entityManager.update(deltaTime: deltaTime)
        if let human = entityManager.castleForTeam(team: .Team1),
            let humanCastle = human.component(ofType: CastleComponent.self) {
            coin1Label.text = "\(humanCastle.coins)"
        }
        if let ai = entityManager.castleForTeam(team: .Team2),
            let aiCastle = ai.component(ofType: CastleComponent.self) {
            coin2Label.text = "\(aiCastle.coins)"
        }
    }
  
    // MARK: Métodos customizados
    func configBackground() {
        // Start background music
        let bgMusic = SKAudioNode(fileNamed: "Latin_Industries.mp3")
        bgMusic.autoplayLooped = true
        addChild(bgMusic)
        
        // Add background
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        addChild(background)
    }
    
    func configButtons() {
        // Add quirk button
        quirkButton = ButtonNode(iconName: "quirk1", text: "10", onButtonPress: quirkPressed)
        quirkButton.position = CGPoint(x: size.width * 0.25, y: margin + quirkButton.size.height / 2)
        addChild(quirkButton)
        
        // Add zap button
        zapButton = ButtonNode(iconName: "zap1", text: "25", onButtonPress: zapPressed)
        zapButton.position = CGPoint(x: size.width * 0.5, y: margin + zapButton.size.height / 2)
        addChild(zapButton)
        
        // Add munch button
        munchButton = ButtonNode(iconName: "munch1", text: "50", onButtonPress: munchPressed)
        munchButton.position = CGPoint(x: size.width * 0.75, y: margin + munchButton.size.height / 2)
        addChild(munchButton)
    }
    
    func configCoins() {
        // Add coin 1 indicator
        let coin1 = SKSpriteNode(imageNamed: "coin")
        coin1.position = CGPoint(x: margin + coin1.size.width/2, y: size.height - margin - coin1.size.height/2)
        addChild(coin1)
        coin1Label.fontSize = 50
        coin1Label.fontColor = SKColor.black
        coin1Label.position = CGPoint(x: coin1.position.x + coin1.size.width/2 + margin, y: coin1.position.y)
        coin1Label.zPosition = 1
        coin1Label.horizontalAlignmentMode = .left
        coin1Label.verticalAlignmentMode = .center
        coin1Label.text = "10"
        self.addChild(coin1Label)
        
        // Add coin 2 indicator
        let coin2 = SKSpriteNode(imageNamed: "coin")
        coin2.position = CGPoint(x: size.width - margin - coin1.size.width/2, y: size.height - margin - coin1.size.height/2)
        addChild(coin2)
        coin2Label.fontSize = 50
        coin2Label.fontColor = SKColor.black
        coin2Label.position = CGPoint(x: coin2.position.x - coin2.size.width/2 - margin, y: coin1.position.y)
        coin2Label.zPosition = 1
        coin2Label.horizontalAlignmentMode = .right
        coin2Label.verticalAlignmentMode = .center
        coin2Label.text = "10"
        self.addChild(coin2Label)
    }
    
    /**
    * @brief Cria, posiciona e insere as entidades(players) no manager e na scene
    */
    func adicionaEntidades() {
        let humamCastle = self.obtemCastle(comNomeDoArquivo: "castle1_atk", naPosicao: .esquerda, noTeam:.Team1)
        let aiCastle = self.obtemCastle(comNomeDoArquivo: "castle2_atk", naPosicao: .direita, noTeam:.Team2)
        
        entityManager.add(entity: humamCastle)
        entityManager.add(entity: aiCastle)
    }
    
    /**
     * @brief Cria um Castle e posiciona conforme a posição esquerda ou direita
     * @return Um Castle configurado
     */
    func obtemCastle(comNomeDoArquivo fileName:String, naPosicao posicao:Posicao, noTeam team:Team) -> Castle {
        let castle = Castle(withFileName: fileName, andTeam:team)
        if let spriteComponent = castle.component(ofType: SpriteComponent.self) {
            let posicaoX = posicao == .direita ? size.width - (spriteComponent.node.size.width / 2) : spriteComponent.node.size.width/2
            let posicaoY = size.height / 2
            spriteComponent.node.position = CGPoint(x: posicaoX, y: posicaoY)
        }
        return castle
    }
    
    func quirkPressed() {
        print("Quirk pressed!")
        entityManager.spawnQuirk(team: .Team1)
    }
    
    func zapPressed() {
        print("Zap pressed!")
    }
    
    func munchPressed() {
        print("Munch pressed!")
    }
    
    func showRestartMenu(_ won: Bool) {
        
        if gameOver {
            return;
        }
        gameOver = true
        
        let message = won ? "You win" : "You lose"
        
        let label = SKLabelNode(fontNamed: "Courier-Bold")
        label.fontSize = 100
        label.fontColor = SKColor.black
        label.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        label.zPosition = 1
        label.verticalAlignmentMode = .center
        label.text = message
        label.setScale(0)
        addChild(label)
        
        let scaleAction = SKAction.scale(to: 1.0, duration: 0.5)
        scaleAction.timingMode = SKActionTimingMode.easeInEaseOut
        label.run(scaleAction)
        
    }
}
