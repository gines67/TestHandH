//
//  AuthorisationAssembler.swift
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
            c.presenter = r.resolve(AuthorisationPresenterProtocol.self)
        }
        container.register([Validator].self) { _ in
            [UppercaseValidator(), LowercaseValidator(), NumberValidator(), LengthStringValidator()]
        }
        container.register(Validator.self, name: "email"){ _ in EmailValidator()}
        container.register(Validator.self, name: "password"){ r in
            CompositValidator(withValidators: r.resolve([Validator].self)!)
        }
        container.register(WeatherService.self) { _ in
            WeatherService(withKey: keyWaterApi, lat: 54.7663836, lon: 32.0857986)
        }
        container.register(AuthorisationPresenterProtocol.self) { r in
            let presenter = AuthorisationPresenter(withEmailValidator: r.resolve(Validator.self, name: "email")!,
                                   passwordValidator: r.resolve(Validator.self, name: "password")!)
            presenter.service = r.resolve(WeatherService.self)
            return presenter
        }
        return container
    }
}
