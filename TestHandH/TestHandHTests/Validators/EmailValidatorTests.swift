//
//  EmailValidatorTests.swift
//  TestHandHTests
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import XCTest
@testable import TestHandH

class EmailValidatorTests: XCTestCase {
    
    var validator: Validator?
    
    override func setUp() {
        super.setUp()
        validator = EmailValidator()
    }
    
    func testIsValid_IsNotEmail_returnFalse() {
        let inputstring = "sksfdfsdfmvksm./sdfs"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertFalse(result!)
    }
    
    func testIsValid_IsEmail_returnTrue() {
        let inputstring = "dkfkdjfk@gmail.com"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
    
}
