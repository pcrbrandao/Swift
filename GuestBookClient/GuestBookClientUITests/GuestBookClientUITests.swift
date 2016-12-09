//
//  GuestBookClientUITests.swift
//  GuestBookClientUITests
//
//  Created by Pedro Brandão on 02/12/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import XCTest
@testable import GuestBookClient

class GuestBookClientUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdicionaUmRegistro() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        
        // no storyboard foram preenchidos em Accessibility, identifier
        // com exceção do buttom
        let emailTextField = app.textFields["emailField"]
        let titleTextField = app.textFields["titleField"]
        let contentTextField = app.textFields["contentField"]
        let buttomOk = app.buttons["OK"]
        
        let email = "email"
        let titulo = "titulo"
        let conteudo = "conteudo"
        
        app.navigationBars["Guest Books"].buttons["Add"].tap()
        
        emailTextField.typeText(email)
        
        titleTextField.tap()
        titleTextField.typeText(titulo)
        
        contentTextField.tap()
        contentTextField.typeText(conteudo)
        
        buttomOk.tap()
        
        app.alerts["Registro adicionado"].buttons["OK"].tap()
        
        // obtendo o texto na célula: não descobri como melhorar ainda
        let cell = app.tables.cells.element(boundBy: 0).staticTexts.element(boundBy: 0)
        let obtido = cell.label
        let esperado = "\(email), \(titulo), \(conteudo)"
        print("obtido..........: \(obtido)")
        
        XCTAssert(obtido == esperado)
    }
}
