//
//  ViewControllerExtensions.swift
//  PathaoUser
//
//  Created by Muzahidul Islam on 9/27/17.
//  Copyright © 2017 Pathao Inc. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    // MARK: Pop to History VC
    
    func backToViewController(restorationIdentifier: String, completion: @escaping ()->Void) {
        
        guard let navVC = self.navigationController else {
            print("navigation controller not found")
            return
        }
        
        for vc in navVC.viewControllers {
            if vc.restorationIdentifier == restorationIdentifier {
                CATransaction.begin()
                CATransaction.setCompletionBlock(completion)
                navVC.popToViewController(vc, animated: true)
                CATransaction.commit()
                break
            }
        }
    }
    
    func openURL(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, completionHandler: { (success) in
                   // glog("URL opened: \(success)") // Prints true
                })
            } else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(url)
            }
        }
    }
  
    
    func showCommonAlert(title: String, message: String, okMsg: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: okMsg, style: .default, handler: { (action: UIAlertAction!) in
           // glog("showCommonAlert Ok Tapped")
        }))
        
        present(alert, animated: true, completion: nil)
    }

    func showSuccess(message: String) {
       // PLog.trace(#function)
        
       // PPHUD.showSuccess(withStatus: message)
    }
    
    func showFail(message: String) {
       // PLog.trace(#function)
        //PPHUD.showError(withStatus: message)
    }
}

extension UIViewController {
    func showAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title,
                                       style: .default,
                                       handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert,
                     animated: true,
                     completion: nil)
        
    }
}


extension UIApplication {
    class func topViewController(base: UIViewController? = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

extension UIViewController {
    // copy to clipboard function
    func copyToClipBoard(textToCopy: String) {
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = textToCopy
    }
}

extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 200, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "TitilliumWeb-Regular", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

