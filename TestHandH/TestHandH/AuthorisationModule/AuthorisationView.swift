//
//  AutorisationView.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 15.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AutorisationView: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var emailTextField: UnderLineTextField!
    @IBOutlet weak var passwordTextField: WithButtonTextField!
    
    //MARK:- Variables
    var disposeBag = DisposeBag()
    var viewModel: AuthorisationViewModelProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        subscribeToKeyboardNotification()
        bindEmailField()
        bindPasswordField()
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        
    }
    
    func bindEmailField(){
        emailTextField.rx.text.orEmpty
            .throttle(0.5, scheduler: MainScheduler.instance)
            .map { (email) -> Bool in
                if email == "" {
                    return true
                }
                return self.viewModel.emailIsValid(email)
            }
            .bind { isValid in
                self.emailTextField.bottomLine.backgroundColor = (isValid ? grayColor : .red).cgColor
            }.disposed(by: disposeBag)
    }
    
    func bindPasswordField(){
        passwordTextField.rx.text.orEmpty
            .throttle(0.5, scheduler: MainScheduler.instance)
            .map { (password) -> Bool in
                if password == "" {
                    return true
                }
                return self.viewModel.passwordIsValid(password)
            }
            .bind { isValid in
                self.passwordTextField.bottomLine.backgroundColor = (isValid ?  grayColor : .red).cgColor
            }.disposed(by: disposeBag)
    }
    
    deinit {
        removeSubscribeToKeyboardNotification()
    }
}

//MARK:- work with keyboard notification
extension AutorisationView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func subscribeToKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func removeSubscribeToKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyBoardWillShow(_ notif: NSNotification)  {
        let userInfo = notif.userInfo
        let keyBoardSize = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        self.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: UIScreen.main.bounds.height - keyBoardSize.height)
    }
    
    @objc func keyBoardWillHide()  {
        self.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: UIScreen.main.bounds.height)
    }
}
