//
//  GuestBookController.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 02/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit
import Alamofire

class GuestBookController: NSObject {
    
    private var guestBooks = [GuestBook]()
    
    private let servicePath = "http://localhost:3000/guestbook"
    
    static let sharedController = GuestBookController()
    
    func addEntry(email:String, title:String, content:String) {
        
    }
}
