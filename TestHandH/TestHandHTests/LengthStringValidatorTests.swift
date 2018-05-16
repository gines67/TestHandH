//
//  LengthStringValidatorTests.swift
//  TestHandHTests
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import XCTest
@testable import TestHandH

class LengthStringValidatorTests: XCTestCase {
    
    var validator: Validator?
    
    override func setUp() {
        super.setUp()
        validator = LengthStringValidator()
    }
    
    func testIsValid_LengthLess6_returnFalse() {
        let inputstring = "sksfd"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertFalse(result!)
    }
    
    func testIsValid_LengthEquals6_returnTrue() {
        let inputstring = "1kцВРА"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
    
    func testIsValid_LengthMore6_returnTrue() {
        let inputstring = "1kцВРА45FHjlk7"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }

    
}
