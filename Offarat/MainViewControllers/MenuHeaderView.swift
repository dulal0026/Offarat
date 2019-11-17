//
//  MenuHeaderView.swift
//  GAME
//
//  Created by Dulal Hossain on 11/10/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

class MenuHeaderView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable:UILabel!
    @IBOutlet weak var dividerView:UIView!

    var headerTap:(()->Void)?
    
    var isExpand:Bool = false {
        didSet{
            imageView.image = UIImage.init(named: isExpand ? "up_arrow":"down_arrow")
            dividerView.isHidden = isExpand
        }
    }
    func fill(_ header: CategoryModel){
        titleLable.text = header.name ?? ""
        if let exp = header.isExpand{
            isExpand = exp
        }
        else{
            isExpand = false
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        isExpand = false
    }
    @IBAction func tapAction(_ sender: UIButton){
        headerTap!()
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

extension String {
    func getImage()-> UIImage?{
        return UIImage.init(named: self)
    }
}
