//
//  HomeTabbarController.swift
//  Darahem
//
//  Created by Dulal Hossain on 13/10/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

class HomeTabbarController: UITabBarController {
    
    @IBOutlet weak var titleView: UIView!
    
    @IBOutlet weak var searchBar: UIBarButtonItem!
    @IBOutlet weak var searchTextField:BorderTextField!

    @IBOutlet weak var searchWidth: NSLayoutConstraint!
    
    var isSearchOn: Bool = false{
        didSet{
            searchBar.image = isSearchOn ?  #imageLiteral(resourceName: "text_clear") : #imageLiteral(resourceName: "search_icon")
            titleView?.isHidden = !isSearchOn
            searchTextField.text = nil
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        isSearchOn = false
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = Color.colorPrimary
        self.delegate = self
        searchWidth.constant = UIScreen.main.bounds.width - 140
        searchTextField.placeholder = Search.localizedValue()
    }
    @IBAction func menuAction(_ sender: UIBarButtonItem){
        DrawerManager.manager.openClose(true)
    }
    
    @IBAction func notificationAction(_ sender: UIBarButtonItem){
     }
    
    @IBAction func searchAction(_ sender: UIBarButtonItem){
        
        isSearchOn = !isSearchOn
    }
}

extension HomeTabbarController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
       /* if viewController.isKind(of: FavoriteVC.self) || viewController.isKind(of: MyBidVC.self) || viewController.isKind(of: CartsVC.self) {
            if AppSessionManager.shared.isLoggedIn() {
                return true
            }
            LoginPopupView.showLoginPopup(self)
            return false
        }*/
        return true
    }
}
