//
//  CompositValidator.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class CompositValidator: Validator {
    
    private var validators: [Validator]
    
    init(withValidators validators: [Validator]) {
        self.validators = validators
    }
    
    func isValid(validationString: String) -> Bool {
        for validator in validators where !validator.isValid(validationString: validationString) {
            return false
        }
        return true
    }
}
