//
//  LowercaseValidator.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class LowercaseValidator: Validator {
    
    func isValid(validationString: String) -> Bool {
        let lowerCase = NSCharacterSet.lowercaseLetters
        
        for char in validationString.unicodeScalars where lowerCase.contains(char) {
            return true
        }
        return false
    }
}
