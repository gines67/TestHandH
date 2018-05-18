//
//  AuthorisationPresenter.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 18.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import Foundation

class AuthorisationPresenter: AuthorisationPresenterProtocol {

    //MARK:- private variables
    private var emailValidator: Validator
    private var passwordValidator: Validator
    
    //MARK:- public variables
    var service: WeatherService!
    
    //MARK:- inits
    init(withEmailValidator emailValidator: Validator, passwordValidator: Validator) {
        self.emailValidator = emailValidator
        self.passwordValidator = passwordValidator
    }
    
    //MARK:- AuthorisationPresenterProtocol
    func emailIsValid(_ email: String) -> Bool {
        return emailValidator.isValid(validationString: email)
    }
    
    func passwordIsValid(_ password: String) -> Bool {
        return passwordValidator.isValid(validationString: password)
    }
    
    func authorisation(email: String, password: String, callback: @escaping (String) -> Void) {
        if emailValidator.isValid(validationString: email)&&passwordValidator.isValid(validationString: password) {
            service.getData(withSuccesHandler: { weather in
                callback(weather.toString())
            }) { error in
                callback(error.localizedDescription)
            }
        }
        else {
            callback(notValidMessage)
        }
    }
}
