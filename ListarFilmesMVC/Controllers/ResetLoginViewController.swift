//
//  ResetLoginViewController.swift
//  ListarFilmesMVC
//
//  Created by William Moreira on 27/04/23.
//

import UIKit
import FirebaseAuth

class ResetLoginViewController: UIViewController, ResetLoginViewDelegate {
    
    var resetLoginView = ResetLoginView()
    
    override func loadView() {
        super.loadView()
        view = resetLoginView
        resetLoginView.delegate = self
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetLoginButtonPressed() {
        getData()
    }
    
    func getData() {
        let email = resetLoginView.inputLogin.text!
        if !email.isEmpty {
            tryReset(email: email)
        } else {
            showAlert(title: ProjectStrings.errorInLoginField.localized,
                      message: ProjectStrings.errorInLoginFieldMessage.localized,
                      result: false)
        }
    }
    
    func tryReset(email: String) {
        self.resetLoginView.activityIndicator.startAnimating()
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            self.resetLoginView.activityIndicator.stopAnimating()
            if let error = error as NSError? {
                if error.code == 17011 {
                    self.showAlert(title: ProjectStrings.userNotFound.localized,
                                   message: ProjectStrings.userNotFoundMessage2.localized,
                                   result: false)
                }
                if error.code == 17008 {
                    self.showAlert(title: ProjectStrings.incorrectEmailFormat.localized,
                                   message: ProjectStrings.incorrectEmailFormatMessage.localized,
                                   result: false)
                }
                return
            }
            self.showAlert(title: ProjectStrings.success.localized,
                           message: ProjectStrings.guidelinesHaveBeenSentToYourEmail.localized,
                           result: true)
            
        }
    }
    
    func goToLogin() {
        self.navigationController?.popViewController(animated: true)
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
}
