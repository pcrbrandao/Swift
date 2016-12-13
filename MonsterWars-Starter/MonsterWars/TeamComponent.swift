//
//  TeamComponent.swift
//  MonsterWars
//
//  Created by Pedro Brandão on 21/11/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

/**
 * @brief Os times possíveis e utilidades
 */
enum Team: Int {
    case Team1 = 1
    case Team2 = 2
    
    static let allValues = [Team1, Team2]
    
    func oppositeTean() -> Team {
        switch self {
        case .Team1:
            return .Team2
        case .Team2:
            return .Team1
        }
    }
}

/**
 * @brief Contém um parâmetro apenas: Team
 */
class TeamComponent: GKComponent {
    let team: Team
    
    init(withTeam team:Team) {
        self.team = team
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
