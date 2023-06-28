//
//  LoginView.swift
//  ListarFilmesMVC
//
//  Created by William Moreira on 26/04/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginButtonPressed()
    func resetButtonPressed()
    func createButtonPressed()
    func dismissKeyboard()
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    lazy var titleLoginLabel = UILabel()
    lazy var titleSenhaLabel = UILabel()

    lazy var titleView: UILabel = {
        let titleView = UILabel()
        titleView.font = UIFont.systemFont(ofSize: 24)
        return titleView
    }()

    lazy var inputLogin: UITextField = {
        let textField = UITextField()
        textField.placeholder = ProjectStrings.enterEmail.localized
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var inputSenha: UITextField = {
        let textField = UITextField()
        textField.placeholder = ProjectStrings.enterPassword.localized
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: ProjectStrings.recoveryPassword.localized, attributes: underlineAttribute)
        button.setAttributedTitle(underlineAttributedString, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: ProjectStrings.createAccount.localized, attributes: underlineAttribute)
        button.setAttributedTitle(underlineAttributedString, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInit()
    }
    
    private func setupInit() {
        self.titleView.text = ProjectStrings.titleLoginView.localized
        self.titleLoginLabel.text = ProjectStrings.email.localized
        self.inputLogin = inputLogin
        self.titleSenhaLabel.text = ProjectStrings.password.localized
        self.inputSenha = inputSenha
        self.loginButton.setTitle( ProjectStrings.enter.localized, for: .normal)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        setupLayout()
    }
    
    private func setupLayout() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        titleSenhaLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLogin.translatesAutoresizingMaskIntoConstraints = false
        inputSenha.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        recoverPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLoginLabel)
        self.addSubview(titleSenhaLabel)
        self.addSubview(inputLogin)
        self.addSubview(inputSenha)
        self.addSubview(loginButton)
        self.addSubview(recoverPasswordButton)
        self.addSubview(registerButton)
        self.addSubview(titleView)
        self.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            titleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            titleLoginLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 100),
            titleLoginLabel.leftAnchor.constraint(equalTo: self.inputLogin.leftAnchor, constant: 0),
            
            inputLogin.topAnchor.constraint(equalTo: titleLoginLabel.bottomAnchor, constant: 10),
            inputLogin.widthAnchor.constraint(equalToConstant: 300),
            inputLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            titleSenhaLabel.topAnchor.constraint(equalTo: inputLogin.bottomAnchor, constant: 50),
            titleSenhaLabel.leftAnchor.constraint(equalTo: self.inputLogin.leftAnchor, constant: 0),
            
            inputSenha.topAnchor.constraint(equalTo: titleSenhaLabel.bottomAnchor, constant: 10),
            inputSenha.widthAnchor.constraint(equalToConstant: 300),
            inputSenha.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            loginButton.topAnchor.constraint(equalTo: inputSenha.bottomAnchor, constant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            recoverPasswordButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            recoverPasswordButton.widthAnchor.constraint(equalToConstant: 200),
            recoverPasswordButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            registerButton.topAnchor.constraint(equalTo: recoverPasswordButton.bottomAnchor, constant:10),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    @objc func loginButtonPressed() {
        delegate?.loginButtonPressed()
    }
    
    @objc func resetButtonPressed() {
        delegate?.resetButtonPressed()
    }

    @objc func createButtonPressed() {
        delegate?.createButtonPressed()
    }
    
    @objc func dismissKeyboard() {
        delegate?.dismissKeyboard()
    }
}

