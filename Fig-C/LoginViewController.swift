//
//  LoginViewController.swift
//  Fig-C
//
//  Created by maaz tausif on 20/02/2022.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var viewPasswordMain: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewEmailMain: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        txtEmail.text = "figc@gmail.com"
//        txtPassword.text = "12345678"
        viewEmailMain.layer.cornerRadius = 15
        viewEmailMain.layer.borderWidth = 1.0
        viewEmailMain.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        
        viewPasswordMain.layer.cornerRadius = 15
        viewPasswordMain.layer.borderWidth = 1.0
        viewPasswordMain.layer.borderColor = UIColor(hexString: "#5E338C").cgColor
        
        btnLogin.layer.cornerRadius = 24
        btnLogin.layer.borderWidth = 1.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLoginPressed(_ sender: Any) {
//        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { [weak self] authResult, error in
//          guard let strongSelf = self else { return }
//            let storyBoard = UIStoryboard(name:"Main", bundle:nil)
//            let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//            self!.present(vc, animated: true, completion: nil)
//          // ...

//        }
        showUniversalLoadingView(true, loadingText: "Loading...")
        Auth.auth().signIn(withEmail:  txtEmail.text!, password: txtPassword.text!) { (user, error) in
            if error != nil {
                showUniversalLoadingView(false, loadingText: "")
                showAlert(inViewController: self, title: "Error!", message: "Invalid Email or Password")
            }else{
                showUniversalLoadingView(false, loadingText: "")
                let storyBoard = UIStoryboard(name:"Main", bundle:nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                self.present(vc, animated: true, completion: nil)
                
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
