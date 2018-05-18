//
//  AuthorisationAssembly.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 18.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class AuthorisationAssembler {
    
    func assemble() -> Container {
        let container = Container()
        container.storyboardInitCompleted(AutorisationView.self) { r, c in
            c.viewModel = r.resolve(AuthorisationViewModelProtocol.self)
        }
        container.register([Validator].self) { _ in
            [UppercaseValidator(), LowercaseValidator(), NumberValidator(), LengthStringValidator()]
        }
        container.register(Validator.self, name: "email"){ _ in EmailValidator()}
        container.register(Validator.self, name: "password"){ r in
            CompositValidator(withValidators: r.resolve([Validator].self)!)
        }
        container.register(AuthorisationViewModelProtocol.self) { r in
            AuthorisationViewModel(withEmailValidator: r.resolve(Validator.self, name: "email")!,
                                   passwordValidator: r.resolve(Validator.self, name: "password")!)
        }
        return container
    }
}
