//
//  GuestBookController.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 02/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import Alamofire
import HTTPStatusCodes

class GuestBookController: NSObject {
    
    private var guestBooks = [GuestBook]()
    
    let serviceURL = "http://localhost:3000/guestbook"
    
    static let sharedController = GuestBookController()
    
    func addEntry(email:String, title:String, content:String) {
        let guestBook = GuestBook(email: email, title: title, content: content)
        
        let parameters: Parameters = guestBook.toDic()
        
        Alamofire.request(serviceURL, parameters: parameters, encoding: JSONEncoding.default).response { response in
            if response.response?.statusCode == HTTPStatusCode.ok.hashValue {
                self.guestBooks.append(guestBook)
            }
        }
    }
    
    func getGuestBooks() -> [GuestBook]? {
        if self.guestBooks.count > 0 {
            return self.guestBooks
        } else {
            return nil
        }
    }
}
