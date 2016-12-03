//
//  GuestBook.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 02/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import UIKit

class GuestBook: NSObject {
    
    var Id: Int
    var email: String
    var title: String
    var content: String
    
    init(withId id:Int, email:String, title:String, content:String) {
        
        self.Id = id
        self.email = email
        self.title = title
        self.content = content
        
        super.init()
    }
}
