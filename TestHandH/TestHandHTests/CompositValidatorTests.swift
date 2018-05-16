//
//  CompositValidatorTests.swift
//  TestHandHTests
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import XCTest
@testable import TestHandH

class CompositValidatorTests: XCTestCase {

    var validator: Validator?
    
    override func tearDown() {
        super.tearDown()
        validator = nil
    }

    func testIsValid_UpperAndLowerValidateNotContainsUpper_returnFalse() {
        validator = CompositValidator(withValidators: [UppercaseValidator(), LowercaseValidator()])
        let inputstring = "sksfdfsdfmvksm"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertFalse(result!)
    }
    
    func testIsValid_UpperAndLowerValidateNotContainsLower_returnFalse() {
        validator = CompositValidator(withValidators: [UppercaseValidator(), LowercaseValidator()])
        let inputstring = "JFFHJHFD"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertFalse(result!)
    }
    
    func testIsValid_PasswordValidateNotContainsLower_returnFalse() {
        validator = CompositValidator(withValidators: [UppercaseValidator(), LowercaseValidator(), LengthStringValidator(), NumberValidator()])
        let inputstring = "JFFHJHFD1221"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertFalse(result!)
    }
    
    func testIsValid_ContainsUpperAndLower_returnTrue() {
        validator = CompositValidator(withValidators: [UppercaseValidator(), LowercaseValidator()])
        let inputstring = "dkfkdjffhHDJG"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
    
    func testIsValid_ValidatorsIsEmpty_returnTrue() {
        validator = CompositValidator(withValidators: [])
        let inputstring = "dkfkdjffhHDJG"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
    
    func testIsValid_PasswordValidateIsValid_returnTrue() {
        validator = CompositValidator(withValidators: [UppercaseValidator(), LowercaseValidator(), LengthStringValidator(), NumberValidator()])
        let inputstring = "Jb12312"
        
        let result = validator?.isValid(validationString: inputstring)
        
        XCTAssertTrue(result!)
    }
}
