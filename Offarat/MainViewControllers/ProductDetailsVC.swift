//
//  ProductDetailsVC.swift
//  Offarat
//
//  Created by Dulal Hossain on 2/11/19.
//  Copyright © 2019 DL. All rights reserved.
//

import UIKit

struct SlideModel {
    var image:String?
    var link:String?
}

class ProductDetailsVC: UIViewController {
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    fileprivate let itemsPerRow: CGFloat = 1

    @IBOutlet weak var detailsTitleLabel: UILabel!
    @IBOutlet weak var fromTitleLabel: UILabel!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    var product: ProductModel?
    let sm1 = SlideModel(image: "", link: "")
    
    var images: [SlideModel] = []

    func reload(){
        self.galleryCollectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [sm1,sm1,sm1]
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        galleryCollectionView.isPagingEnabled = true

        galleryCollectionView?.delegate = self
        galleryCollectionView?.dataSource = self

        setBackButton()
        guard let product = product else {
            return
        }
        fill(product)
        reload()
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

extension ProductDetailsVC : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell: GalleryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
        let info: SlideModel = images[indexPath.row]
       // cell.filledPageInfo(slide: info)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        //let info: String = data[indexPath.row]
        
        // delegate?.didPressonGallery(control: self, info: info)
        //self.removeFromSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // let paddingSpace = 1 * (itemsPerRow + 1)
        // let availableWidth = (UIScreen.main.bounds.width - 40)
        //let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension ProductDetailsVC: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
