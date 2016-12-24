//
//  LoginViewController.swift
//  StudentsUITest
//
//  Created by Lucy Nguyen on 12/24/16.
//  Copyright © 2016 Lucy Nguyen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideNavigationBar(false)
    }
    
    func hideNavigationBar(_ isHidden: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignInAction(_ sender: Any) {
        guard let username = userNameTextField.text, username.characters.count > 0 else {
            showErrorAlertWithMessage("Username cannot be empty")
            return
        }
        
        guard let password = passwordTextField.text, password.characters.count > 0 else {
            showErrorAlertWithMessage("Password cannot be empty")
            return
        }
        
        guard username == LoginInfo.correctUsername && password == LoginInfo.correctPassword else {
            showErrorAlertWithMessage("Incorrect username and password")
            return
        }
        
        performSegue(withIdentifier: "showTopScreenSegue", sender: self)
    }

    
}
