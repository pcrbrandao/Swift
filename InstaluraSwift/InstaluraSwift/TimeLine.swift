//
//  TimeLineAPI.swift
//  InstaluraSwift
//
//  Created by Pedro Brandão on 01/07/2018.
//  Copyright © 2018 Pedro Brandão. All rights reserved.
//

import UIKit
import ReSwift

struct TimeLineState: StateType {
    var fotos:[String] = ["foto1", "foto2", "foto3"]
}

struct ListaAction: Action {
    var novasFotos = [String]()
}

func timeLineReducer(action: Action, state: TimeLineState?) -> TimeLineState {
    var state: TimeLineState = state ?? TimeLineState()
    
    switch action {
    case let lista as ListaAction:
        state.fotos = lista.novasFotos
    default:
        break
    }
    
    return state
}
