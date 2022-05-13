//import Foundation
//import FirebaseFirestore
//
//class TasksViewModel: ObservableObject{
//    @Published var myTasks = [MyTask]()
//    
//    private var db = Firestore.firestore()
//    
//    
//    func fetchData() {
//        db.collection("Tasks").addSnapshotListener{ (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else{
//                print("Currently empty")
//                return
//            }
//            self.myTasks = documents.map{(queryDocumentSnapshot) -> MyTask in
//                let data = queryDocumentSnapshot.data()
//                let title = data["title"] as? String ?? ""
//                let description = data["description"] as? String ?? ""
//                let url = data["url"] as? String ?? ""
////                print(data, title, url)
//                
//                return MyTask(description: description, title: title, url: url)
//            }
//        }
//    }
//    
//}
