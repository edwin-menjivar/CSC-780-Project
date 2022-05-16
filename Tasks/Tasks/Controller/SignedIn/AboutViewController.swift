import UIKit
import FirebaseFirestore
import Firebase
import SwiftUI
import Foundation



class AboutViewController: UIViewController  {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    deinit{

    }
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.load(urlString: "https://previews.123rf.com/images/svetlam87/svetlam871901/svetlam87190100007/114794096-healthy-lifestyle-different-physical-activities-running-roller-skates-dancing-bodybuilding-yoga-fitn.jpg")
    }
}


