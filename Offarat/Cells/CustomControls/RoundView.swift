//
//  RoundView.swift
//  Nidaa
//
//  Created by Dulal Hossain on 25/10/19.
//  Copyright © 2019 3DVI. All rights reserved.
//

import UIKit

class ShadowView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        layer.cornerRadius = 8
        //layer.borderWidth = 1
        // layer.borderColor = UIColor.gray.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize.init(width: 1, height: 1)
        layer.masksToBounds = false
    }
}
