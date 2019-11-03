

import UIKit

class ProductCell: UITableViewCell, StoryboardIdentifier {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var offerTitleLabel: UILabel!
    @IBOutlet weak var fromTitleLabel: UILabel!

    var shareAction:(()->Void)?
    var favoriteAction:(()->Void)?
    var callAction:(()->Void)?
    var locationAction:(()->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(_ product: ProductModel) {
        nameLabel.text = product.name ?? ""
        productImageView.image = UIImage.init(named: product.image ?? "")
        offerTitleLabel.text = offer.localizedValue()
        fromTitleLabel.text = from.localizedValue()
    }
    
    @IBAction func shareButtonAction(_ sender: UIButton){
        
         if let hand = shareAction{
            hand()
        }
    }
    
    
    @IBAction func favoriteButtonAction(_ sender: UIButton){
        if let hand = shareAction{
            hand()
        }
    }
    
    
    @IBAction func locationButtonAction(_ sender: UIButton){
        if let hand = shareAction{
            hand()
        }
    }
    
    @IBAction func callButtonAction(_ sender: UIButton){
        if let hand = shareAction{
            hand()
        }
    }    
}


