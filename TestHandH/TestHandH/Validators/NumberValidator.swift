//
//  NumberValidator.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class NumberValidator: Validator {
    
    func isValid(validationString: String) -> Bool {
        let regExptest = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
        return regExptest.evaluate(with: validationString)
    }
}
