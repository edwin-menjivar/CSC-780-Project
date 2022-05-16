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
    var docLabel = ""
    var photo = UIImageView()

    // Fields for updating an entry
    @IBOutlet weak var titleUpdateTF: UITextField!
    @IBOutlet weak var urlUpdateTF: UITextField!
    @IBOutlet weak var descUpdateTF: UITextField!
   
    // Fields for deleting an entry
        
    
    @IBAction func deleteButtonPressed(_ sender: Any) {

//        let uid = Auth.auth().currentUser!.uid

        print(docLabel)
        showDeleteTask(docLabel: docLabel)
        
    }
    
    
    @IBAction func updateButtonPressed(_ sender: UIButton) {
        guard let title = titleUpdateTF.text, !title.isEmpty,
                let description = descUpdateTF.text, !description.isEmpty,
                let url = urlUpdateTF.text, !url.isEmpty else{
                  print("There is missing information")
                    return
              }
        
            db.collection("Tasks").document(docLabel).updateData([
                "title": title,
                "description": description,
                "url": url,
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleUpdateTF.text = titleLabel
        descUpdateTF.text = descLabel
        urlUpdateTF.text = urlLabel
        
        
        // Do any additional setup after loading the view.
    }
    
    func showDeleteTask(docLabel: String){
        let alert = UIAlertController(title: "Delete Task", message: "Would you like to delete task", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: {_ in
            //Place code here
            self.db.collection("Tasks").document(docLabel).delete { err in
                if let err = err {
                  print("Error removing document: \(err)")
                }
                else {
                  print("Document successfully removed!")
                }
            }
            self.performSegue(withIdentifier: "deleteToMainSegue", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in}))
        present(alert, animated: true)
    }
    
}
