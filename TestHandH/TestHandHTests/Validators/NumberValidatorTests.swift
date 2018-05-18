//
//  NumberValidatorTests.swift
//  TestHandHTests
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import XCTest
@testable import TestHandH

class NumberValidatorTests: XCTestCase {
    
    var validator: Validator?
    
    override func setUp() {
        super.setUp()
        validator = NumberValidator()
    }
    
    func testIsValid_NotContainNumber_returnFalse() {
        let inputstring = "sksfgdFJGJDФВВА"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertFalse(result!)
    }
    
    func testIsValid_ContainNumberInBegin_returnTrue() {
        let inputstring = "1kцВРА45FHjlk7"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
    
    func testIsValid_ContainNumberInCenter_returnTrue() {
        let inputstring = "kцВРА4FHjlk"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
    
    func testIsValid_ContainNumberInEnd_returnTrue() {
        let inputstring = "kцВРАFHjlk7"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
    
}
