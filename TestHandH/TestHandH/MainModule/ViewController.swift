//
//  ViewController.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 15.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit
import SwinjectStoryboard

class ViewController: UIViewController {
    
    let assembler = AuthorisationAssembler()
    
    @IBAction func GoToAuthorisation(_ sender: Any) {
        let container = assembler.assemble()
        let authSB = SwinjectStoryboard.create(name: "Authorisation", bundle: nil, container: container)
        let authView  = authSB.instantiateViewController(withIdentifier: "AuthSB")
        self.navigationController?.pushViewController(authView, animated: true)
    }
}

