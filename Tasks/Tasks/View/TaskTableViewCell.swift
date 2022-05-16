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
            let defaultImageUrl = "https://media.istockphoto.com/vectors/thumbnail-image-vector-graphic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27JUapoyYpQm0anc="
            photo.load(urlString: defaultImageUrl)
        }
        else {
            photo.load(urlString: myTask.url)
        }
        
    }
    
//    override func prepareForReuse(){
//
//    }
}
