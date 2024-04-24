//
//  LoginScreen.swift
//  project-viewcode
//
//  Created by Kaique Lopes de Oliveira on 18/04/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func loginButtonTapped()
}

class LoginScreen: UIView {

    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var screenLogin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tela Login"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail:"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        return label
    }()
    lazy var emailTextField: UITextField = {
        let emailTF = UITextField()
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.placeholder = "Digite seu E-mail"
        emailTF.keyboardType = .emailAddress
        emailTF.autocorrectionType = .no
        emailTF.borderStyle = .roundedRect
        return emailTF
    }()
    
    lazy var passwordTextField: UITextField = {
        let passTF = UITextField()
        passTF.translatesAutoresizingMaskIntoConstraints = false
        passTF.placeholder = "Digite seu E-mail"
        passTF.keyboardType = .default
        passTF.borderStyle = .roundedRect
        passTF.autocorrectionType = .no
        return passTF
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isEnabled = false
        button.backgroundColor = .lightGray.withAlphaComponent(0.6)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    func loginButtonTapped() {
        print("LoginScreen")
        delegate?.loginButtonTapped()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .green
        
        [ screenLogin, emailLabel, emailTextField, passwordLabel, passwordTextField, loginButton ].forEach { view in
            addSubview(view)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            screenLogin.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            screenLogin.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: screenLogin.bottomAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 6),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 45)

        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    public func checkLoginButton() {
        let emailTF = emailTextField.text ?? ""
        let passTF = passwordTextField.text ?? ""
        
        if !emailTF.isEmpty && !passTF.isEmpty {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .lightGray
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .lightGray.withAlphaComponent(0.6)
        }
    }

}
