import UIKit

class TaskCell: UITableViewCell{
    // Configure the cell
//    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(myTask: MyTask){
        titleLabel.text = "Edwin"
        descLabel.text = "Here"
    }
}
