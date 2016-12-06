//
//  GuestBookController.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 02/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import Alamofire
import HTTPStatusCodes

/**
 * @brief Utiliza os webservices e retorna o resultado para os view controllers
 */
class GuestBookController: NSObject {
    
    // a lista de Guest Books registrados
    private var guestBooks = [GuestBook]()
    
    let serviceURL = "http://localhost:3000/guestbook"
    
    static let sharedController = GuestBookController()
    
    func addEntry(email:String, title:String, content:String) -> (ok:Bool, code:Int)? {
        
        var ok = true
        var code: Int = 0
        
        if dadosValidos(strings: [email, title, content]) {
            
            let id = self.guestBooks.count
            
            let guestBook = GuestBook(id:id, email: email, title: title, content: content)
            let parameters: Parameters = guestBook.toDic()
            
            //Alamofire.request(serviceURL, parameters: parameters, encoding: JSONEncoding.default).response { response in
            //    code = (response.response?.statusCode)!
            //    if code == HTTPStatusCode.ok.hashValue {
            self.guestBooks.append(guestBook)
            //    } else {
            //        ok = false
            //    }
            //}
        } else {
            ok = false
        }
        return (ok, code)
    }
    
    func getGuestBooks() -> [GuestBook]? {
        if self.guestBooks.count > 0 {
            return self.guestBooks
        } else {
            return nil
        }
    }
    
    // testa campos
    func dadosValidos(strings: [String]) -> Bool {
        
        if strings.count <= 0 {
            return false
        }
        
        for string in strings {
            if string.campoValido != true {
                return false
            }
        }
        return true
    }
}

extension String {
    var campoValido: Bool {
        let count = self.characters.count
        if count <= 0 || count > 40 {
            return false
        } else {
            return true
        }
    }
}
