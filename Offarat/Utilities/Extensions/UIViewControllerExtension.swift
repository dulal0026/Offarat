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
 
    func setBackButton()  {
        let backBtn = UIBarButtonItem(image: UIImage(named: "back_icon"), style: .plain, target: self, action: #selector(goBack))
        backBtn.tintColor = .white
        navigationItem.leftBarButtonItem = backBtn
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
   
    func showShareController() {
        let items = [URL(string: "https://www.apple.com")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
}
