//
//  ProductDetailsVC.swift
//  Offarat
//
//  Created by Dulal Hossain on 2/11/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

class ProductDetailsVC: UIViewController {
    @IBOutlet weak var detailsTitleLabel: UILabel!
    @IBOutlet weak var fromTitleLabel: UILabel!

    var product: ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        guard let product = product else {
            return
        }
        fill(product)
    }
    
    func fill(_ product: ProductModel) {
        
        detailsTitleLabel.text = details.localizedValue()
        fromTitleLabel.text = from.localizedValue()
    }
    
    @IBAction func shareButtonAction(_ sender: UIButton){
       showShareController()
    }
    
    
    @IBAction func favoriteButtonAction(_ sender: UIButton){
       
    }

    @IBAction func locationButtonAction(_ sender: UIButton){
    }
    
    @IBAction func callButtonAction(_ sender: UIButton){

    }

}
