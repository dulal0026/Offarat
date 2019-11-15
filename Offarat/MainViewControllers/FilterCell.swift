

import UIKit

class FilterCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!
    
    var cellSelected: Bool = false{
        didSet{
            selectedImageView.image = cellSelected ? UIImage.init(named: "ticket_icon") : nil
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellSelected = false
    }
    
    func fill(_ name:String, _ selectedNames: [String]){
        nameLabel.text = name
        let nms = selectedNames.filter { (existName) -> Bool in
            name == existName
        }

        cellSelected = !(nms.count == 0)

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
