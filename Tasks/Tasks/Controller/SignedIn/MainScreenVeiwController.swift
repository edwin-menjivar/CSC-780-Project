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
    @objc private func SignOutPressed(){
        do{
            try FirebaseAuth.Auth.auth().signOut()
        }catch{
            print("Something went wrong")
        }
    }

    override func viewDidLoad() {

        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
//        super.viewDidLoad()
        tasksCollectionRef = Firestore.firestore().collection("Tasks")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tasksCollectionRef.getDocuments { snapshot, error in
            if let err = error{
                debugPrint("Error fetching docs: \(err)")
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
                self.tableView.reloadData()
                
            }
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
            cell.configureCell(with: myTask)
            return cell

        }else{
            return UITableViewCell()
        }
    }
}


