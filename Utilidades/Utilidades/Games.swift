//
//  Games.swift
//  Utilidades
//
//  Created by Pedro Brandão on 26/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import SceneKit

@objc public class Games: NSObject {
    
    static public func unityVector(fromVector startVector: SCNVector3, toPoint targetVector:SCNVector3) ->SCNVector3 {
        
        let angle = atan2f(targetVector.z - startVector.z, targetVector.x - startVector.x)
        
        return SCNVector3.init(cos(angle), 0, sinf(angle))
    }
}
