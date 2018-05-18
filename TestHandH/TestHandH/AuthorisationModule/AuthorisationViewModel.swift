//
//  AuthorisationViewModel.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 18.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import Foundation

class AuthorisationViewModel: AuthorisationViewModelProtocol {

    private var emailValidator: Validator
    private var passwordValidator: Validator
    
    init(withEmailValidator emailValidator: Validator, passwordValidator: Validator) {
        self.emailValidator = emailValidator
        self.passwordValidator = passwordValidator
    }
    func emailIsValid(_ email: String) -> Bool {
        return emailValidator.isValid(validationString: email)
    }
    
    func passwordIsValid(_ password: String) -> Bool {
        return passwordValidator.isValid(validationString: password)
    }
    
    func authorisation(email: String, password: String, callback: @escaping () -> Void) {
        
    }
}
