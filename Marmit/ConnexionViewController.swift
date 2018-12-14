//
//  ConnexionViewController.swift
//  Marmit
//
//  Created by Etienne Gobion on 13/12/2018.
//  Copyright © 2018 Marmit. All rights reserved.
//

import UIKit
import Firebase

class ConnexionViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Connexion(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            if user != nil {
                print("User has signed in")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let secondViewController = storyboard.instantiateViewController(withIdentifier: "tabBar") as! TabBarViewController
                self.present(secondViewController, animated: true, completion: nil)
            }
            if error != nil {
                print("Error zhile trying to signed in")
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
