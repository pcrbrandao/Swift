//
//  GuestBookControllerTests.swift
//  GuestBookClient
//
//  Created by Pedro Brandão on 04/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import XCTest
@testable import GuestBookClient

class GuestBookControllerTests: XCTestCase {
    
    let controller = GuestBookController.sharedController
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDadosValidosDevemSerFalse() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let email = ""
        let title = "Titulo"
        let content = "Content"
        XCTAssertFalse(controller.dadosValidos(strings: [email, title, content]))
    }
    
    func testDadosValidosDevemSerTrue() {
        let email = "email"
        let title = "titulo"
        let content = "content"
        
        XCTAssert(controller.dadosValidos(strings: [email, title, content]))
    }
    
    func testSeTextoGrandeDeveSerFalse() {
        let email = "lskdkdofodklskdkdlkslkslskdjf;;;akjfglkksmdlkfak"
        let title = "kllkkma; aijosd  iojjoiqw  lkadslk; qioj; ; ads;k;klf ;ioja"
        let content = "nlkkmlad  fdal;mkuhp fadjknjnqp[ a ;lkasdf;k aiooijew alk;mdf"
        
        XCTAssertFalse(controller.dadosValidos(strings: [email, title, content]))
    }
    
    func testUmItemDeveSerTrue() {
        let email = "pcrbrandao@gmail.com"
        XCTAssert(controller.dadosValidos(strings: [email]))
    }
    
    func testVazioDeveSetFalso() {
        XCTAssertFalse(controller.dadosValidos(strings: []))
    }
    /*
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
     */
    
}
