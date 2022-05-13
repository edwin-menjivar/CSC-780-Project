import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageOne: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)    }
    
    func configureCell(with myTask: MyTask){
        titleLabel.text = myTask.title
        descLabel.text = myTask.description
        imageOne.layer.cornerRadius = 10
        
        let string = myTask.url
        let urlString = string.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        let url = URL(string: urlString!)

//        let decodedUrl = urlString?.removingPercentEncoding
        imageOne.load(urlString: myTask.url)
        
    }
}
