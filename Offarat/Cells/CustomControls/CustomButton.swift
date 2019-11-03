//
//  RoundButton.swift
//  Nidaa
//
//  Created by Dulal Hossain on 25/10/19.
//  Copyright © 2019 3DVI. All rights reserved.
//

import UIKit

@IBDesignable

class BorderButton: UIButton {

    @IBInspectable var borderWidth:CGFloat = 2.0 {
        didSet{ setNeedsLayout() } }
    
    @IBInspectable var borderColor:UIColor = UIColor.clear { didSet { setNeedsLayout() } }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        layer.masksToBounds = true
    }

}


