//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!


    @IBOutlet weak var errorMessage: UILabel!


    override func viewDidLoad() {
        errorMessage.text = ""
    }

    @IBAction func registerPressed(_ sender: UIButton) {

        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) {
                authResult, error in
                if let e = error {
                    self.errorMessage.text = e.localizedDescription
                    print(e.localizedDescription)
                }
                else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }

}
