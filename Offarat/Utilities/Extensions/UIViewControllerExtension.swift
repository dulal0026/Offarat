//
//  UIViewControllerExtension.swift
//  GAME
//
//  Created by Dulal Hossain on 11/10/19.
//  Copyright © 2019 DL. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @IBAction func menuButtonAction(sender: AnyObject) {
        DrawerManager.manager.openClose(true)
    }
    
    
    func setBackButton()  {
        //let button = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 30, height: 30)))
       // button.setImage(UIImage(named: "ic_back"), for: .normal)

        let backBtn = UIBarButtonItem(image: UIImage(named: "back_icon"), style: .plain, target: self, action: #selector(goBack))

        backBtn.tintColor = .white
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)

        navigationItem.leftBarButtonItem = backBtn
    }
    
    func setMenuButton(menuAction:Selector = #selector(UIViewController.menuButtonAction(sender:))) {
        
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 28, height: 20)))
        
        button.setImage(UIImage(named: "menu_icon"), for: .normal)
        button.addTarget(self, action: menuAction, for: .touchUpInside)
        button.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func setRightNavigationButton(image:UIImage, menuAction:Selector = #selector(UIViewController.rightButtonAction(sender:))) {
        
        let button = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 28, height: 20)))
        button.imageEdgeInsets = UIEdgeInsets.init(top: 3, left: 3, bottom: 3, right: 3)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: menuAction, for: .touchUpInside)
        button.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    @IBAction func rightButtonAction(sender: AnyObject) {
    }
    
    @objc @IBAction func goBack(sender: AnyObject) {
        if let nav = navigationController {
            // If in a nav stack, pop me out
            if let index = nav.viewControllers.firstIndex(of: self), index > 0 {
                nav.popViewController(animated: true)
            }
                
                // If presented along with a nav, dismiss the nav
            else if nav.presentingViewController != nil {
                nav.dismiss(animated: true, completion: {
                    
                })
            }
        }
            // If simply presenting, dismiss me
        else if presentingViewController != nil {
            dismiss(animated: true, completion: {
            })
        }
    }
    
    
    func showAlert(title:String, message:String, okButtonTitle:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: okButtonTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showConfimationAlert(_ msg:String){
        let alertVC = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (aciton) in
            self.dismiss(animated: true, completion: nil)
            
        })
        
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func navigateWith(_ itentifier: String, sb:String)  {
    }
    
    func showShareController() {
        let items = [URL(string: "https://www.apple.com")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
}
