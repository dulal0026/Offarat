//
//  HomeVC.swift
//
//  Created by Dulal Hossain on 11/9/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    static let minimumSpacing = 20

    var catagories:[CategoryModel] = []
    @IBOutlet weak var    catagoryCollectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catagoryCollectionView.delegate = self
        catagoryCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func loadData() {
        loadCategories(fileName: "category") { (categories) in
            self.catagories = categories
            self.catagoryCollectionView.reloadData()
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

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catagories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.halfWidth(20)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatagoryCollectionCell", for: indexPath as IndexPath) as! CatagoryCollectionCell
        let wallpaper = catagories[indexPath.item]
        cell.fill(wallpaper)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DrawerManager.manager.changeTab(3)
    }
    
}

extension UIViewController {    
    func halfWidth(_ padding: Int = 0) -> Double{
        let screenWidth: Double = (Double(UIScreen.main.bounds.width))-Double(((padding*2) + (HomeVC.minimumSpacing)))
        return screenWidth / 2
    }
}
