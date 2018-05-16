//
//  LowercaseValidatorTest.swift
//  TestHandHTests
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import XCTest
@testable import TestHandH

class LowercaseValidatorTests: XCTestCase {
    
    var validator: Validator?
    
    override func setUp() {
        super.setUp()
        validator = LowercaseValidator()
    }
    
    func testIsValid_NotContainLowercase_returnFalse() {
        let inputstring = "23123FJGJDФВВА"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertFalse(result!)
    }
    
    func testIsValid_ContainLowercase_returnTrue() {
        let inputstring = "23123kцВРАFHjlk"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
    
}
