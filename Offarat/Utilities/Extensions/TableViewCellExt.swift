//
//  TableViewCellExt.swift
//  PathaoUser
//
//  Created by Muzahidul Islam on 11/13/17.
//  Copyright © 2017 Pathao Inc. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    func isLast(indexPath: IndexPath) -> Bool {
        
        var _tableView: UITableView? = nil
        var view = superview
        
        while (view != nil) {
            if let tblView = view as? UITableView{
                _tableView = tblView
            }
            view = view?.superview
        }
        guard let tableView = _tableView else {
            return false
        }
        if indexPath.section == (tableView.numberOfSections - 1){
            if indexPath.row == (tableView.numberOfRows(inSection: indexPath.section) - 1){
                return true
            }
        }
        return false
    }
    func isFirst(indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return true
            }
        }
        return false
    }
}
