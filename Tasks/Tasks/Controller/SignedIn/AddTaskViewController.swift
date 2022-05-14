import UIKit
import FirebaseFirestore
import Firebase
import SwiftUI
import Foundation

class AddTaskViewController: UIViewController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    deinit{
        
    }
    
    private var db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // Fields for adding a new entry
    @IBOutlet weak var titleTF: UITextField!

    @IBOutlet weak var descTF: UITextField!
    @IBOutlet weak var urlTF: UITextField!
    @IBAction func addTaskButtonPressed(_ sender: UIButton) {
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
    
    
}
