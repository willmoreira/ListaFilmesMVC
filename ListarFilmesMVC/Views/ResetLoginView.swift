//
//  ResetLoginView.swift
//  ListarFilmesMVC
//
//  Created by William Moreira on 27/04/23.
//

import UIKit

protocol ResetLoginViewDelegate: AnyObject {
    func resetLoginButtonPressed()
}

class ResetLoginView: UIView {
    
    weak var delegate: ResetLoginViewDelegate?
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    lazy var titleLoginLabel = UILabel()

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
    
    lazy var resetLoginButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(resetLoginButtonPressed), for: .touchUpInside)
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
        self.titleView.text = ProjectStrings.recoveryPassword2.localized
        self.titleLoginLabel.text = ProjectStrings.email.localized
        self.inputLogin = inputLogin
        self.resetLoginButton.setTitle(ProjectStrings.send.localized, for: .normal)
        setupLayout()
    }
    
    private func setupLayout() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLogin.translatesAutoresizingMaskIntoConstraints = false
        resetLoginButton.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        addSubview(titleView)
        addSubview(titleLoginLabel)
        addSubview(inputLogin)
        addSubview(resetLoginButton)
        addSubview(activityIndicator)
        
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
          
            resetLoginButton.topAnchor.constraint(equalTo: inputLogin.bottomAnchor, constant: 50),
            resetLoginButton.widthAnchor.constraint(equalToConstant: 150),
            resetLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    @objc func resetLoginButtonPressed() {
        delegate?.resetLoginButtonPressed()
    }
}
