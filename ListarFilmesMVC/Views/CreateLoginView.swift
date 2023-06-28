//
//  CreateLoginView.swift
//  ListarFilmesMVC
//
//  Created by William Moreira on 27/04/23.
//

import UIKit

protocol CreateLoginViewDelegate: AnyObject {
    func createButtonPressed()
}

class CreateLoginView: UIView {
    
    weak var delegate: CreateLoginViewDelegate?
    let activityIndicator = UIActivityIndicatorView(style: .large)

    lazy var titleLoginLabel = UILabel()
    lazy var titlePasswordLabel = UILabel()

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
    
    lazy var createLoginButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
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
        self.titleView.text = ProjectStrings.registerLogin.localized
        self.titleLoginLabel.text = ProjectStrings.email.localized
        self.inputLogin = inputLogin
        self.titlePasswordLabel.text = ProjectStrings.password.localized
        self.inputSenha = inputSenha
        self.createLoginButton.setTitle(ProjectStrings.register.localized, for: .normal)
        setupLayout()
    }
    
    private func setupLayout() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        titlePasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLogin.translatesAutoresizingMaskIntoConstraints = false
        inputSenha.translatesAutoresizingMaskIntoConstraints = false
        createLoginButton.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLoginLabel)
        self.addSubview(titlePasswordLabel)
        self.addSubview(inputLogin)
        self.addSubview(inputSenha)
        self.addSubview(createLoginButton)
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
            
            titlePasswordLabel.topAnchor.constraint(equalTo: inputLogin.bottomAnchor, constant: 50),
            titlePasswordLabel.leftAnchor.constraint(equalTo: self.inputLogin.leftAnchor, constant: 0),
            
            inputSenha.topAnchor.constraint(equalTo: titlePasswordLabel.bottomAnchor, constant: 10),
            inputSenha.widthAnchor.constraint(equalToConstant: 300),
            inputSenha.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            createLoginButton.topAnchor.constraint(equalTo: inputSenha.bottomAnchor, constant: 50),
            createLoginButton.widthAnchor.constraint(equalToConstant: 150),
            createLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }

    @objc func createButtonPressed() {
        delegate?.createButtonPressed()
    }
    
}

