//
//  LoginVC.swift
//  project-viewcode
//
//  Created by Kaique Lopes de Oliveira on 27/03/24.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
    }
}

extension LoginVC: LoginScreenProtocol {
    func loginButtonTapped() {
        print("Chegou na LoginVC")
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

