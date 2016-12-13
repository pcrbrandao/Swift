//
//  GuestBookTests.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 08/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import XCTest
@testable import GuestBookClient

class GuestBookTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToDic() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let gb = GuestBook.init(email: "pcrbrandao", title: "titulo", content: "content")
        let gbDic = gb.toDic()
        let email = gbDic["email"] as! String
        XCTAssert( email == "pcrbrandao")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
