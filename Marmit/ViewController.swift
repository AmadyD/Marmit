//
//  ViewController.swift
//  Marmit
//
//  Created by Etienne Gobion on 07/12/2018.
//  Copyright © 2018 Marmit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signup(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            if user != nil {
                print("User as Signed Up!")
            }
            if error != nil {
                print("Error while trying to Signed Up")
                print(error)
            }
        }
    }
    
    @IBAction func signin(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            if user != nil {
                print("User as Signed In!")
            }
            if error != nil {
                print("Error while trying to Signed In")
            }
        }
    }
}

