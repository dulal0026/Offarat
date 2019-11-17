//
//  MenuTableCell.swift
//  iCheckVehicles
//
//  Created by Dulal Hossain on 8/8/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

class MenuTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    func filled(_ subC: SubCategoryModel)  {
        titleLabel?.text = subC.name ?? ""
    }
}
