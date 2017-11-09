//
//  ViewController.swift
//  mdb
//
//  Created by Timar Cristian on 24/10/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
//import Alamofire
//import SwiftMailgun
class ViewController: UIViewController {

    @IBOutlet var LoginSelector: UISegmentedControl!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var forgotButton: UIButton!
    
    var isLogin:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 15.0
        forgotButton.layer.cornerRadius = 5
        forgotButton.titleEdgeInsets.left = 4
        forgotButton.titleEdgeInsets.right = 4
        loginButton.layer.cornerRadius = 5
        loginButton.titleEdgeInsets.left = 4
        loginButton.titleEdgeInsets.right = 4
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginSelectorChange(_ sender: UISegmentedControl) {
        
        isLogin = !isLogin
        if isLogin{
            loginButton.setTitle("Login", for: .normal)
        }
        else{
            loginButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToForgot", sender: self)
        print("Forgot button tapped");
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        //validations
        if let email = emailTextField.text, let pass = passwordTextField.text {
            if isLogin{
                // login the user with fb
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    // check that user isn't nil
                    if let u = user{
                        //user is found , go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else{
                        self.showAlert(title: "Login Error", message: "Invalid email or password.")
                    }
                }
            }
            else{
                // register the user with fb
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    // check that user isn't nil
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else{
                        self.showAlert(title: "Register Error", message: "Please fill the inputs correct.")
                    }
                }
                
            }
        }
    }
    // this will prevent keyboard from showing
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }
    
    
}

