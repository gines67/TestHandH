//
//  Validator.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 16.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import Foundation

protocol Validator {
    func isValid(validationString: String) -> Bool
}
