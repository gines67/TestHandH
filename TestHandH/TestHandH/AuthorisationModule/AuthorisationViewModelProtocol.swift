//
//  AuthorisationViewModelProtocol.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 18.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import Foundation

protocol AuthorisationViewModelProtocol {
    func emailIsValid(_ email: String) -> Bool
    func passwordIsValid(_ password: String) -> Bool
    func authorisation(email: String, password: String, callback: @escaping() -> Void)
}
