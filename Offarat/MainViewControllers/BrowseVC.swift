//
//  BrowseVC.swift
//
//
//  Created by Dulal Hossain on 11/9/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

class BrowseVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!

    var products:[ProductModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadProducts(fileName: "products") { (prods) in
            self.products = prods
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib.init(nibName: ProductCell.sbIdentifier, bundle: Bundle.main), forCellReuseIdentifier: ProductCell.sbIdentifier)
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func loadProducts(fileName: String, with completion:(_ categories:[ProductModel])->Void) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder:JSONDecoder = JSONDecoder()
                
                let categories = try decoder.decode([ProductModel].self, from: data)
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
  
}

extension BrowseVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: ProductCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.fill(products[indexPath.row])
        cell.shareAction = { [weak self] in
            self?.showShareController()
        }
        cell.locationAction = { [weak self] in
        }
        cell.callAction = { [weak self] in
        }
        cell.favoriteAction = { [weak self] in
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc:ProductDetailsVC = (UIStoryboard.storyBoard(storyBoard: .Main).instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsVC)
        vc.product = products[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
