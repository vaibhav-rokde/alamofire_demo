import UIKit

class cellTableTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var editTreeContent: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }

}