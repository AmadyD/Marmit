//
//  InscriptionViewController.swift
//  Marmit
//
//  Created by Etienne Gobion on 13/12/2018.
//  Copyright © 2018 Marmit. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class InscriptionViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Inscription(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            if user != nil {
                print("User has signed up")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let secondViewController = storyboard.instantiateViewController(withIdentifier: "connexion") as! ConnexionViewController
                self.present(secondViewController, animated: true, completion: nil)
            }
            if error != nil {
                print("Error while trying to signed up")
                print(error)
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
