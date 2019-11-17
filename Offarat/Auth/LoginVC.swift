//
//  LoginVC.swift
//  Offarat
//
//  Created by Dulal Hossain on 2/11/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var skipButton:BorderButton!
    @IBOutlet weak var loginButton:BorderButton!
    @IBOutlet weak var signupButton:BorderButton!
    @IBOutlet weak var facebookLoginButton:UIButton!
    @IBOutlet weak var googleLoginButton:BorderButton!
    @IBOutlet weak var languageButton:BorderButton!
    
    @IBOutlet weak var userNameTextField:BorderTextField!
    @IBOutlet weak var passwordTextField:BorderTextField!

    @IBOutlet weak var facebookLabel: UILabel!
    
    @IBOutlet weak var googleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillLocalizaitonInfo()
    }
    
    func fillLocalizaitonInfo() {
        userNameTextField.placeholder = username.localizedValue()
        passwordTextField.placeholder = password.localizedValue()
        skipButton.setTitle(skip.localizedValue(), for: .normal)
        loginButton.setTitle(login.localizedValue(), for: .normal)
        languageButton.setTitle(language_arabic.localizedValue(), for: .normal)
        signupButton.setTitle(signup.localizedValue(), for: .normal)
        facebookLabel.text = login_facebook.localizedValue()
        googleLabel.text = login_google.localizedValue()
    }

    @IBAction func loginAction(_ sender: UIButton){
        Presenter.shared.setTabbarAsRoot()
    }
    
    @IBAction func SignupAction(_ sender: UIButton){
        Presenter.shared.setTabbarAsRoot()
    }
    
    @IBAction func skipAction(_ sender: UIButton){
        Presenter.shared.setTabbarAsRoot()
    }
    
    @IBAction func googleLoginAction(_ sender: UIButton){
    }
    
    @IBAction func facebookLoginAction(_ sender: UIButton){
        
    }
    
    @IBAction func languageChangeAction(_ sender: UIButton){
        let lang = LocalizationSystem.shared.getLanguage()
        LocalizationSystem.shared.setLanguage(languageCode: lang == "en" ? "ar":"en")
        UIView.appearance().semanticContentAttribute = lang == "en" ?   .forceLeftToRight : .forceRightToLeft

        Presenter.shared.setLoginAsRoot()
    }
}
