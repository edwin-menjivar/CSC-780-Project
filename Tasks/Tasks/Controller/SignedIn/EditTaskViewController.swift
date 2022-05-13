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

    // Fields for updating an entry
    @IBOutlet weak var titleUpdateTF: UITextField!
    @IBOutlet weak var urlUpdateTF: UITextField!
    @IBOutlet weak var descUpdateTF: UITextField!
   
    // Fields for deleting an entry
        
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        let uid = Auth.auth().currentUser!.uid
        db.collection("Taks").whereField(titleUpdateTF.text ?? "", isEqualTo: uid).getDocuments() { (querySnapshot, err) in
          if let err = err {
            print("Error getting documents: \(err)")
          } else {
            for document in querySnapshot!.documents {
              document.reference.delete()
            }
          }
        }
        
    }
    // Fields for adding a new entry
    @IBOutlet weak var urlTF: UITextField!
    @IBOutlet weak var descTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
    print("Add task button pressed")
        guard let title = titleTF.text, !title.isEmpty,
                let description = descTF.text, !description.isEmpty,
                let url = urlTF.text, !url.isEmpty else{
                  print("There is missing information")
                    return
              }
        // Add a new document in collection "cities"
        
        db.collection("Tasks").addDocument(data: [
            "title": title,
            "description": description,
            "url": url
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
