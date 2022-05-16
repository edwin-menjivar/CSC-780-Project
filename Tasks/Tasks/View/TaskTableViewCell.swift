import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var docLabel: UILabel!
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
        docLabel.text = myTask.documendId
        if (myTask.url == "n/a"){
            let defaultImageUrl = "https://icon-library.com/images/no-photo-available-icon/no-photo-available-icon-4.jpg"
            photo.load(urlString: defaultImageUrl)
        }
        else {
            photo.load(urlString: myTask.url)
        }
        
    }
}
