//
//  CreateLoginViewController.swift
//  ListarFilmesMVC
//
//  Created by William Moreira on 27/04/23.
//

import UIKit
import FirebaseAuth

class CreateLoginViewController: UIViewController, CreateLoginViewDelegate{
    
    var createLoginView = CreateLoginView()
    var listFilms: [Result] = []
    var login: String = ProjectStrings.stringEmpty.localized
    var senha: String = ProjectStrings.stringEmpty.localized
    
    override func loadView() {
        super.loadView()
        view = createLoginView
        view.backgroundColor = .white
        createLoginView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createButtonPressed() {
        getData()
    }
    
    func getData() {
        senha = createLoginView.inputSenha.text!
        login = createLoginView.inputLogin.text!
        
        if !login.isEmpty {
            if !senha.isEmpty {
                tryCreateLogin()
            } else {
                showAlert(title: ProjectStrings.errorInPasswordField.localized,
                          message: ProjectStrings.errorInPasswordFieldMessage.localized,
                          result: false)
            }
        } else {
            showAlert(title: ProjectStrings.errorInLoginField.localized,
                      message: ProjectStrings.errorInLoginFieldMessage.localized,
                      result: false)
        }
    }
    
    func tryCreateLogin() {
        createLoginView.activityIndicator.startAnimating()
        Auth.auth().createUser(withEmail: login, password: senha) { authResult, error in
            self.createLoginView.activityIndicator.stopAnimating()
            if let error = error as NSError? {
                if error.code == 17007 {
                    self.showAlert(title: ProjectStrings.emailAlreadyInUse.localized,
                                             message: ProjectStrings.emailAlreadyInUseMessage.localized,
                                             result: false)
                }
                if error.code == 17008 {
                    self.showAlert(title: ProjectStrings.incorrectEmailFormat.localized,
                                             message: ProjectStrings.incorrectEmailFormatMessage.localized,
                                             result: false)
                }
                if error.code == 17026 {
                    self.showAlert(title: ProjectStrings.passwordRule.localized,
                                             message: ProjectStrings.passwordRuleMessage.localized,
                                             result: false)
                }
                return
            }
            self.createLoginView.activityIndicator.stopAnimating()
            self.showAlert(title: ProjectStrings.success.localized,
                               message: ProjectStrings.userSuccessfullyCreatedMessage.localized,
                               result: true)
        }
    }
    
    func showAlert(title: String, message: String, result: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: ProjectStrings.ok.localized, style: .default) { action in
            if result {
                self.goToLogin()
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func goToLogin() {
        self.navigationController?.popViewController(animated: true)
    }
}
