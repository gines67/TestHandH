//
//  LengthStringValidator.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class LengthStringValidator: Validator {
    
    private var minimalLen: Int 
    
    init(minimalLenght: Int = 6) {
        minimalLen = minimalLenght
    }
    
    func isValid(validationString: String) -> Bool {
        return validationString.count >= minimalLen
    }
}
