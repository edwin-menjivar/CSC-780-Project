import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)    }
    
    func configureCell(with myTask: MyTask){
        titleLabel.text = myTask.title
        descLabel.text = myTask.description
        urlLabel.text = myTask.url
        photo.load(urlString: myTask.url)
    }
}
