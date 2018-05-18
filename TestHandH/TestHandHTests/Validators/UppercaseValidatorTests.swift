//
//  TestHandHTests.swift
//  TestHandHTests
//
//  Created by Сергей Герасимов on 15.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import XCTest
@testable import TestHandH

class UppercaseValidatorTests: XCTestCase {
    
    var validator: Validator?
    
    override func setUp() {
        super.setUp()
        validator = UppercaseValidator()
    }
    
    func testIsValid_NotContainUppercase_returnFalse() {
        let inputstring = "23123kljlkjlk"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertFalse(result!)
    }
    
    func testIsValid_ContainUppercase_returnTrue() {
        let inputstring = "23123klЙkjlk"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
    
}
