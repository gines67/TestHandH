//
//  UppercaseValidator.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class UppercaseValidator: Validator {
    func isValid(validationString: String) -> Bool {
        
        let upperCase = NSCharacterSet.uppercaseLetters
        
        for char in validationString.unicodeScalars where upperCase.contains(char) {
            return true
        }
        return false
    }

}
