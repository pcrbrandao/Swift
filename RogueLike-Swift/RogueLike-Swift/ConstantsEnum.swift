//
//  ConstantsEnum.swift
//  RogueLike-Swift
//
//  Created by Pedro Brandão on 03/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit

enum Direction: Int {
    
    case noDirection = 0, up, down, left, right
}

enum PhysicsCategory: UInt32 {
    case none = 0,
    player,
    enemy
}
