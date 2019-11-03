//
//  LocalizationSystem.swift
//  Darahem
//
//  Created by Dulal Hossain on 23/10/19.
//  Copyright © 2019 DL. All rights reserved.
//

import Foundation
import UIKit

class LocalizationSystem:NSObject {
    
    var bundle: Bundle!
    
    class var shared: LocalizationSystem {
        struct Singleton {
            static let instance: LocalizationSystem = LocalizationSystem()
        }
        return Singleton.instance
    }
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localizedStringForKey(key:String, comment:String) -> String {
        return bundle.localizedString(forKey: key, value: comment, table: nil)
    }
    
    func localizedImagePathForImg(imagename:String, type:String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    
    //MARK:- setLanguage
    // Sets the desired language of the ones you have.
    // If this function is not called it will use the default OS language.
    // If the language does not exists y returns the default OS language.
    func setLanguage(languageCode:String) {
        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        appleLanguages.remove(at: 0)
        appleLanguages.insert(languageCode, at: 0)
        UserDefaults.standard.set(appleLanguages, forKey: "AppleLanguages")
        UserDefaults.standard.synchronize() //needs restrat
        
        if let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "lproj")  {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLocalization()
        }
    }
    
    //MARK:- resetLocalization
    //Resets the localization system, so it uses the OS default language.
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    //MARK:- getLanguage
    // Just gets the current setted up language.
    func getLanguage() -> String {
        let appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        let prefferedLanguage = appleLanguages[0]
        if prefferedLanguage.contains("-") {
            let array = prefferedLanguage.components(separatedBy: "-")
            return array[0]
        }
        return prefferedLanguage
    }
    
}



extension String {
    
    func localized(lang:String) -> String {
        
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")//.mainBundle().pathForResource(lang, ofType: “lproj")
        
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    func localizedValue() -> String {
        
        let path = Bundle.main.path(forResource: LocalizationSystem.shared.getLanguage(), ofType: "lproj")//.mainBundle().pathForResource(lang, ofType: “lproj")
        
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}



//
//  LocalizeLanguage.swift
//  Pathao
//
//  Created by Md. Kamrul Hasan on 2/5/17.
//  Copyright © 2017 Shifat Adnan. All rights reserved.
//

import Foundation

//language
let APP_LANGUAGE_KEY    = "APP_LANGUAGE_KEY"
let LANGUAGE_ENGLISH    = "en"
let LANGUAGE_ARABIC    = "ar"

let LANGUAGE_CHANGE_NOTIFICATION = Notification.Name("LANGUAGE_CHANGE_NOTIFICATION")
/*
func getAppLanguage() -> String{
    if( UserDefaults.standard.string(forKey: APP_LANGUAGE_KEY) != nil){
        return UserDefaults.standard.string(forKey: APP_LANGUAGE_KEY)!
    } else {
        UserDefaults.standard.set(LANGUAGE_ENGLISH, forKey: APP_LANGUAGE_KEY)
        UserDefaults.standard.synchronize()
        return UserDefaults.standard.string(forKey: APP_LANGUAGE_KEY)!
    }
}

func setAppLanguage(lang: String){
    UserDefaults.standard.set(lang, forKey: APP_LANGUAGE_KEY)
    UserDefaults.standard.synchronize()
    NotificationCenter.default.post(name: LANGUAGE_CHANGE_NOTIFICATION, object: nil)
    
    if(getAppLanguage() == LANGUAGE_ARABIC){
       // PathaoPayManager.shared.changePPLanguage(lanCode: "bn-BD")
       // appFontName         = "SolaimanLipi"
       // appFontBoldName     = "SolaimanLipi"
       // appFontItalicName   = "SolaimanLipi"
    }
    else{
       // PathaoPayManager.shared.changePPLanguage(lanCode: "en")
       // appFontName         = "Titillium Web"
       // appFontBoldName     = "Titillium Web"
       // appFontItalicName   = "Titillium Web"
    }
    
}
*/

let app_name   = "app_name";
let skip   = "skip";
let username   = "username";
let password   = "password";
let signup   = "signup";
let login   = "login";
let login_google   = "login_google";
let login_facebook   = "login_facebook";

let language_english   = "language_english"
let language_arabic   = "language_arabic";

let notificaions   = "notificaions";
let notificaions_offer   = "notificaions_offer";
let notificaions_store   = "notificaions_store";
let Language   = "Language";
let LogOut   = "LogOut";

let English   = "English";
let Arabic   = "Arabic";

let Cancel   = "Cancel";
let done   = "done";
let SelectCategory   = "SelectCategory";
let AllCategory   = "AllCategory";

let offer   = "offer";
let from   = "from";
let details   = "details";
let Search   = "Search";

