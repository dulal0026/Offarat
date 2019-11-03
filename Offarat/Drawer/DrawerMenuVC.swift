//
//  MenuVC.swift
//  iCheckVehicles
//
//  Created by Dulal Hossain on 8/8/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

class DrawerMenuVC: UIViewController {

    @IBOutlet weak var selectCategoryTitleLabel: UILabel!
    @IBOutlet weak var allCategoryTitleLabel: UILabel!
    
    @IBOutlet weak var menuTableView: UITableView!
    var catagories:[CategoryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.reloadData()
        menuTableView.register(UINib.init(nibName: "MenuFooterCell", bundle: Bundle.main), forCellReuseIdentifier: "MenuFooterCell")
        selectCategoryTitleLabel.text = SelectCategory.localizedValue()
        allCategoryTitleLabel.text = AllCategory.localizedValue()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCategories(fileName: "category") { (categories) in
            self.catagories = categories
            self.menuTableView.reloadData()
        }
    }
    func loadCategories(fileName: String, with completion:(_ categories:[CategoryModel])->Void) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder:JSONDecoder = JSONDecoder()
                
                let categories = try decoder.decode([CategoryModel].self, from: data)
                completion(categories)
            } catch {
                print("error:\(error)")
                completion([])
            }
        }
        else{
            completion([])
        }
    }
}

extension DrawerMenuVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return catagories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sec = catagories[section]
        guard let isExpnd = sec.isExpand else {
            return 0
        }
        return  isExpnd ? sec.subCategories.count:0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subCat = catagories[indexPath.section].subCategories[indexPath.row]
        let cell: MenuTableCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableCell", for: indexPath) as! MenuTableCell
        
        cell.filled(subCat)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: MenuHeaderView = MenuHeaderView.fromNib()
        headerView.headerTap = { [weak self] in
            if let expnd = self?.catagories[section].isExpand{
                self?.catagories[section].isExpand = !(self?.catagories[section].isExpand)!
            }
            else{
                self?.catagories[section].isExpand = true

            }
            
            tableView.reloadSections([section], with: .automatic)

        }
        headerView.fill(catagories[section])
        return headerView
    }
}




