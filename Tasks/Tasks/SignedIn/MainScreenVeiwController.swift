import UIKit
import Firebase

class MainScreenViewController: UIViewController {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    deinit{
        
    }
    
    @objc private func SignOutPressed(){
        do{
            try FirebaseAuth.Auth.auth().signOut()
        }catch{
            print("Something went wrong")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
