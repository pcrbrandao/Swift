//
//  TimelineAPI.swift
//  InstaluraSwift
//
//  Created by Pedro Brandão on 15/07/2018.
//  Copyright © 2018 Pedro Brandão. All rights reserved.
//

import UIKit

class TimelineAPI: NSObject {
    
    static func lista(url:String) {
        // faz o request e despacha a nova
        // lista para o main store
        let novasFotos = ["foto1", "foto2", "foto3", "foto4"]
        mainStore.dispatch(ListaAction(novasFotos: novasFotos))
    }
    
    static func comenta(url:String) {
        
    }
}
