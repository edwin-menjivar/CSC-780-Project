import UIKit
import FirebaseFirestore
import Firebase
import SwiftUI
import Foundation



class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    deinit{

    }

    private var myTasks = [MyTask]()
    private var tasksCollectionRef: CollectionReference!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
        do{
            try FirebaseAuth.Auth.auth().signOut()
        }catch{
            print("Something went wrong")
        }
        self.performSegue(withIdentifier: "signOutSegue", sender: self)
    }

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tasksCollectionRef = Firestore.firestore().collection("Tasks")

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let receiverVC = segue.destination as! EditTaskViewController
//        receiverVC.titleFromMain = TaskTableViewCell.titleLabel.text
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        tasksCollectionRef.getDocuments { snapshot, error in
            self.myTasks.removeAll()
            if let err = error{
                debugPrint("Error fetching docs: \(err)")
                self.tableView.reloadData()

            } else{
                guard let snap = snapshot else {return}
                for document in snap.documents{
                    let data = document.data()
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let url = data["url"] as? String ?? ""
                    let documentId = document.documentID 
                    
                    let newTask = MyTask(description: description, title: title, url: url, documendId: documentId)
                    self.myTasks.append(newTask)
                }
            }
            self.tableView.reloadData()

        }
    }

    func update(with myTasks: MyTask){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTasks.count

    }
    func tableView(_ s: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TaskTableViewCell {
            let myTask = self.myTasks[indexPath.row]
//            cell.resetCell()
            cell.configureCell(with: myTask)
            return cell

        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditTaskViewController") as? EditTaskViewController
        vc?.urlLabel = self.myTasks[indexPath.row].url
        vc?.titleLabel = self.myTasks[indexPath.row].title
        vc?.descLabel = self.myTasks[indexPath.row].description
        vc?.docLabel = self.myTasks[indexPath.row].documendId
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
   
}


