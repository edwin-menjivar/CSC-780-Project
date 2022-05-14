import UIKit
import FirebaseFirestore
import Firebase
import SwiftUI
import Foundation

class EditTaskViewController: UIViewController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    deinit{
        
    }
    
    private var db = Firestore.firestore()
    var urlLabel = ""
    var descLabel = ""
    var titleLabel = ""
    var photo = UIImageView()

    // Fields for updating an entry
    @IBOutlet weak var titleUpdateTF: UITextField!
    @IBOutlet weak var urlUpdateTF: UITextField!
    @IBOutlet weak var descUpdateTF: UITextField!
   
    // Fields for deleting an entry
        
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        //        let uid = Auth.auth().currentUser!.uid
        var jobskill_query = db.collection("Tasks").where("title","==",titleUpdateTF.text);
        jobskill_query.get().then(function(querySnapshot) {
          querySnapshot.forEach(function(doc) {
            doc.ref.delete();
          });
        });

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        titleUpdateTF.text = titleLabel
        descUpdateTF.text = descLabel
        urlUpdateTF.text = urlLabel
        
        
        // Do any additional setup after loading the view.
    }
}
