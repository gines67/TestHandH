//
//  TemplateValidator.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 18.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class TemplateValidator: Validator {
    
    private var validator: (String) -> Bool
    
    init<Object: AnyObject>(withDelegate delegate: Object, validator:@escaping (String, Object) -> Bool ) {
        self.validator = { [weak delegate] validationString in
            validator(validationString, delegate!)
        }
    }
    
    func isValid(validationString: String) -> Bool {
        return validator(validationString)
    }
}
