//
//  UtilidadesTests.swift
//  UtilidadesTests
//
//  Created by Pedro Brandão on 26/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

import XCTest
import SceneKit

@testable import Utilidades

class UtilidadesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUnityVectorComValoresPositivos() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let startVector = SCNVector3.init(0.0, 0.0, 0.0)
        let point = SCNVector3.init(3.0, 0.0, 4.0)
        
        testUnityVector(comStartVector: startVector, point: point)
    }
    
    func testUnityVectorComStartXNegativo() {
        let startVector = SCNVector3.init(-1.0, 0.0, 0.0)
        let point = SCNVector3.init(-3.0, 0.0, 4.0)
        
        testUnityVector(comStartVector: startVector, point: point)
    }
    
    func testUnityVectorComValorZero() {
        let startVector = SCNVector3.init()
        let point = SCNVector3.init()
        
        testUnityVector(comStartVector: startVector, point: point)
    }
    
    func testUnityVectorComValoresNegativos() {
        let startVector = SCNVector3.init(-2, 0, -3)
        let point = SCNVector3.init(-5, 0, -2)
        
        testUnityVector(comStartVector: startVector, point: point)
    }
    
    func testUnityVector(comStartVector startVector:SCNVector3, point:SCNVector3) {
        
        let vetorUnitario = Games.unityVector(fromVector: startVector, toPoint: point)
        let hipotenusa = hypotf(vetorUnitario.x, vetorUnitario.z)
        
        print("A hipotenusa deve ser 1....: \(hipotenusa)")
        XCTAssert(hipotenusa == 1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
