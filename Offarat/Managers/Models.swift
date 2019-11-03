//
//
//  Created by Dulal Hossain on 4/2/17.
//  Copyright © 2017 DL. All rights reserved.
//

import UIKit

class CategoryModel: Codable, Equatable{
    static func == (lhs: CategoryModel, rhs: CategoryModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String?
    var name: String?
    var image: String?
    var subCategories:[SubCategoryModel] = []
    var isExpand:Bool? 
}

class SubCategoryModel: Codable {
    var id: String?
    var name: String?
}

class ProductModel: Codable {
    var id: String?
    var name: String?
    var image: String?

    var offer: String?
    var startDate: String?
    var endDate: String?
    var webAddress: String?
}
