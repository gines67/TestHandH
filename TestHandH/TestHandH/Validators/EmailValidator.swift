//
//  EmailValidator.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class EmailValidator: Validator {
    
    func isValid(validationString: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let regExptest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return regExptest.evaluate(with: validationString)
    }
}
