//
//  SupportViewController.swift
//  mdb
//
//  Created by Timar Cristian on 30/10/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit
import MessageUI

class SupportViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate {

    @IBOutlet var sendButton: UIButton!
    
    @IBOutlet var emailText: UITextField!
    
    
    @IBOutlet var messageField: UITextField!
    @IBOutlet var subjectField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.layer.cornerRadius = 5
        sendButton.titleEdgeInsets.left = 4
        sendButton.titleEdgeInsets.right = 4
        self.messageField.delegate = self
        self.subjectField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {

        if (subjectField.text == "") {
            showAlert(title: "Empty Field", message: "Subject can't be empty")
        }
        if (messageField.text == "") {
            showAlert(title: "Empty Field", message: "Message can't be empty")
        }
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["cristiantimar@gmail.com"])
            mail.setSubject(self.subjectField.text!)
            mail.setMessageBody(self.messageField.text!, isHTML: true)
            
            // present(mail, animated: true)
            self.present(mail, animated: true, completion: nil)
            
        } else {
            showAlert(title: "Error sending mail", message: "We can't send the mail")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
