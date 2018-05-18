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
    var presenter: AuthorisationPresenterProtocol!
    
    //MARK:- ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        subscribeToKeyboardNotification()
        bindEmailField()
        bindPasswordField()
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        presenter.authorisation(email: emailTextField.text!, password: passwordTextField.text!) { message in
            let alert = UIAlertController(title: "Внимание!", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    deinit {
        removeSubscribeToKeyboardNotification()
    }
    
    //MARK:- bindin fields
    func bindEmailField(){
        emailTextField.rx.text.orEmpty
            .throttle(0.5, scheduler: MainScheduler.instance)
            .map { (email) -> Bool in
                if email == "" {
                    return true
                }
                return self.presenter.emailIsValid(email)
            }
            .bind { isValid in
                self.emailTextField.bottomLine.backgroundColor = (isValid ? grayColor : .red).cgColor
            }
            .disposed(by: disposeBag)
    }
    
    func bindPasswordField(){
        passwordTextField.rx.text.orEmpty
            .throttle(0.5, scheduler: MainScheduler.instance)
            .map { (password) -> Bool in
                if password == "" {
                    return true
                }
                return self.presenter.passwordIsValid(password)
            }
            .bind { isValid in
                self.passwordTextField.bottomLine.backgroundColor = (isValid ?  grayColor : .red).cgColor
            }
            .disposed(by: disposeBag)
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
