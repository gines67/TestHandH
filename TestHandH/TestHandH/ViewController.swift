//
//  ViewController.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 15.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func TapToAuth(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Authorisation", bundle: nil)
        
        let authView = storyBoard.instantiateViewController(withIdentifier: "AuthSB") as! AutorisationView
        self.navigationController?.pushViewController(authView, animated: true)
    }
    
}

