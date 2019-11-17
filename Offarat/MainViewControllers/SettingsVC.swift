//
//  SettingsVC.swift
//  Offarat
//
//  Created by Dulal Hossain on 2/11/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

enum SelectedLanguage{
    case english
    case arabic
}

class SettingsVC: UIViewController {
    
    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var englishCheckBox: UIImageView!
    @IBOutlet weak var arabicCheckBox: UIImageView!

    @IBOutlet weak var notificationContainerHeight: NSLayoutConstraint!
    @IBOutlet weak var notificationTitleLabel: UILabel!
    
    @IBOutlet weak var languageTitleLabel: UILabel!
    
    @IBOutlet weak var englishTitleLabel: UILabel!
    
    @IBOutlet weak var arabicTitleLabel: UILabel!

    @IBOutlet weak var logoutTitleLabel: UILabel!
    
    @IBOutlet weak var notificationmeContainerView: UIView!
    @IBOutlet weak var notificationOfferLabel: UILabel!
    @IBOutlet weak var notificaitonStoreLabel: UILabel!
    
    var selectedLanguage:SelectedLanguage = .english{
        didSet{
            let si = UIImage.init(named: "ticket_icon")!
            englishCheckBox.image = selectedLanguage == .english ? si:nil
            arabicCheckBox.image = selectedLanguage == .arabic ? si:nil
        }
    }
    var notificationEnabled:Bool = false{
        didSet{
            notificationContainerHeight.constant = notificationEnabled ? 126:0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationEnabled = false

        let lang = LocalizationSystem.shared.getLanguage()
        selectedLanguage = lang == "en" ? .english:.arabic
        setLocalizedText()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setLocalizedText() {
        notificationTitleLabel.text = notificaions.localizedValue()
        languageTitleLabel.text = Language.localizedValue()
            englishTitleLabel.text = English.localizedValue()
        arabicTitleLabel.text = Arabic.localizedValue()
        logoutTitleLabel.text = LogOut.localizedValue()
        notificationOfferLabel.text = notificaions_offer.localizedValue()
        notificaitonStoreLabel.text = notificaions_store.localizedValue()
    }
    
    @IBAction func notificationAction(_ sender: UISwitch){
        notificationEnabled = sender.isOn
    }
    
    @IBAction func notificationOfferAction(_ sender: UISwitch) {
    }
    @IBAction func notificationStoreAction(_ sender: UISwitch) {
    }
    
    @IBAction func setEnglishLanguage(_ sender: UIButton){
        selectedLanguage = .english
        let lang = LocalizationSystem.shared.getLanguage()
        if lang != "en" {
            LocalizationSystem.shared.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            Presenter.shared.setTabbarAsRoot(4)
        }
    }
    
    @IBAction func setArabicLanguage(_ sender: UIButton){
        selectedLanguage = .arabic
        let lang = LocalizationSystem.shared.getLanguage()

        if lang != "ar" {
            LocalizationSystem.shared.setLanguage(languageCode: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            Presenter.shared.setTabbarAsRoot(4)
        }
    }
    
    @IBAction func logout(_ sender: UISwitch){
        Presenter.shared.logOut()
    }
}
