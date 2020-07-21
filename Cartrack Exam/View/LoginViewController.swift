//
//  LoginViewController.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/20/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit
import Lottie
import TextFieldEffects
import TransitionButton

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mapLogoView: AnimationView!
    @IBOutlet weak var loginButton: TransitionButton!
    @IBOutlet weak var usernameTf: HoshiTextField!
    @IBOutlet weak var passwordTf: HoshiTextField!
    
    lazy var viewModel = { [weak self] in
        return  LoginViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animation = Animation.named("MapLogo")
    
        mapLogoView.animation = animation
        mapLogoView.contentMode = .scaleAspectFit
        mapLogoView.loopMode = .loop
        mapLogoView.play()
        
        loginButton.spinnerColor = .white
        loginButton.addTarget(self, action: #selector(loginAction(_:)), for: .touchUpInside)
        
        loginButton.isEnabled = false
        loginButton.alpha = 0.4
        
        [usernameTf, passwordTf].forEach({
            $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            $0?.delegate = self
        })
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func loginAction(_ button: TransitionButton) {
        self.view.endEditing(true)
        button.startAnimation()
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            sleep(1)
            DispatchQueue.main.async(execute: { () -> Void in
                self.viewModel.authenticate(username: self.usernameTf.text.unwrappedValue,
                                            password: self.passwordTf.text.unwrappedValue) { success in
                    if success {
                        button.stopAnimation(animationStyle: .expand, completion: {
                            self.usernameTf.text = nil
                            self.passwordTf.text = nil
                            let nav = UINavigationController(rootViewController: CTEnum.Storyboard.Main.viewController(UserListViewController.self))
                            nav.modalPresentationStyle = .fullScreen
                            self.present(nav, animated: true, completion: nil)
                        })
                    } else {
                        button.stopAnimation(animationStyle: .shake, completion: {
                            let alert = UIAlertController(title: "Cartrack Exam", message: "Invalid credentials.", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        })
                    }
                }
            })
        })
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 3 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let username = usernameTf.text, !username.isEmpty,
            let password = passwordTf.text, !password.isEmpty
        else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.4
            return
        }
        loginButton.isEnabled = true
        loginButton.alpha = 1.0
    }
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}
