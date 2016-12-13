//
//  Controller.swift
//  SocketChat
//
//  Created by Pedro Brandão on 17/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class Controller: NSObject, GCDAsyncUdpSocketDelegate {
    
    static let sharedController = Controller()
    
    var udpSocket: GCDAsyncUdpSocket?
       
    override init() {
        
        super.init()
        
        udpSocket = GCDAsyncUdpSocket.init(delegate: self, delegateQueue: DispatchQueue.main)
    }
    
    func enviar(mensagem: String) {
        self.udpSocket?.send(mensagem.data(using: String.Encoding.utf8), toHost: "localhost", port: 8000, withTimeout: -1, tag: 1)
    }

}
