//
//  HomeTabbarController.swift
//  Darahem
//
//  Created by Dulal Hossain on 13/10/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

class HomeTabbarController: UITabBarController {
    
    
    var titleView: UIView!
    var searchTextField:BorderTextField!

   // @IBOutlet weak var searchWidth: NSLayoutConstraint!
    
    let searchImage    = UIImage(named: "search_icon")!
    let filterImage  = UIImage(named: "filter icon")!
    
    var filterButton: UIBarButtonItem!
    var searchButton: UIBarButtonItem!

@objc func didTapFilterButton()  {
    let vc:FilterVC = (UIStoryboard.storyBoard(storyBoard: .Main).instantiateViewController(withIdentifier: "FilterVC") as! FilterVC)
    
    self.navigationController?.pushViewController(vc, animated: false)

}
@objc func didTapSearchButton()  {
    isSearchOn = !isSearchOn
}
    
    var isSearchOn: Bool = false{
        didSet{
            searchButton.image = isSearchOn ?  #imageLiteral(resourceName: "text_clear") : #imageLiteral(resourceName: "search_icon")

            titleView?.isHidden = !isSearchOn
            searchTextField.text = nil
        }
    }
    
    var isFilterOn: Bool = false{
        didSet{
            navigationItem.rightBarButtonItems = isFilterOn ? [filterButton,searchButton]:[searchButton]
            let cons:CGFloat = isFilterOn ? 180 : 120
            let width = UIScreen.main.bounds.width - cons

            titleView.frame =  CGRect.init(x: 0, y: 0, width: width, height: 40)

           // titleView?.isHidden = !isSearchOn
           // searchTextField.text = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterButton   = UIBarButtonItem(image: filterImage,  style: .plain, target: self, action: #selector(didTapFilterButton))
        searchButton = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: #selector(didTapSearchButton))
        let width = UIScreen.main.bounds.width - 120
       titleView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: 40))
        
        titleView.backgroundColor = .clear
        searchTextField = BorderTextField(frame: titleView.bounds)
        titleView.addSubview(searchTextField)
        
         navigationItem.titleView = titleView
        
        isFilterOn = false
        isSearchOn = false
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = Color.colorPrimary
        self.delegate = self
       // searchWidth.constant =
        searchTextField.placeholder = Search.localizedValue()
    
    }
   
    @IBAction func menuAction(_ sender: UIBarButtonItem){
        Presenter.shared.openClose(true)
    }
}

extension HomeTabbarController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        isFilterOn = viewController.isKind(of: BrowseVC.self) || viewController.isKind(of: BeautyProductsVC.self)
        
        return true
    }
}
