//
//  GuestBook.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 02/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import ObjectMapper

class GuestBook: Mappable {
    
    var Id: Int?
    var email: String?
    var title: String?
    var content: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        Id <- map["Id"]
        email <- map["email"]
        title <- map["title"]
        content <- map["content"]
    }
    
    init(email:String, title:String, content:String) {
        
        self.email = email
        self.title = title
        self.content = content
    }
    
}

extension GuestBook {
    
    func toDic() -> [String: Any] {
        return ["Id": Id, "email": email, "title":title, "content":content]
    }
    
    func toString() -> String {
        return "id: \(Id), email: \(email), title: \(title), content: \(content)"
    }
}
