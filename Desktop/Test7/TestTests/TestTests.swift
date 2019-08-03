//
//  TestTests.swift
//  TestTests
//
//  Created by Alexander on 08/07/2019.
//  Copyright © 2019 test. All rights reserved.
//

import XCTest
@testable import Test

class TestTests: XCTestCase {
    /*
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
*/
    
    enum MyError: Error {
        
        case RuntimeError(message: String)
        
    }
    
    extension Double {
        
        func reverseSinus() throws -> Double {
            if (abs(self) < Double.ulpOfOne) {
                throw MyError.RuntimeError(message: "Could not evaluate reverse for zero value")
            }
            
            return sin(1 / self)
        }
        
    }
    
    func testReverseSinus() {
        let value = try! 1.0.reverseSinus()
        XCTAssertEqual(0.8414709848078965, value)
    }
}
