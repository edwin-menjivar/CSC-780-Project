import UIKit
import Firebase

class SignUpViewController: UIViewController {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    deinit{
        
    }
  
    @IBAction func SignInButtonPressed(_ sender: Any) {
    }
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        print("Sign Up button pressed")
        guard let email = emailTextField.text, !email.isEmpty,
                let password = passwordTextField.text, !password.isEmpty else{
                  print("There is missing information")
                    return
              }
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let strongSelf = self else{
                return
            }
            guard error == nil else{
                print("Account creation failed")
                strongSelf.couldNotCreateAccount(email: email, password: password)
                return
            }
            print("You are signed in")
            self?.performSegue(withIdentifier: "signedUpSegue", sender: self)
//            strongSelf.label.isHidden = true
            
        })
//        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
//            guard let strongSelf = self else{
//                return
//            }
//            guard error == nil else{
//                strongSelf.couldNotCreateAccount(email: email, password: password)
//                return
//            }
//            print("You are signed in")
//
//        })
    }
    func couldNotCreateAccount(email: String, password: String){
        let alert = UIAlertController(title: "Error", message: "Could not create an account", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {_ in}))
        present(alert, animated: true)
    }
}

