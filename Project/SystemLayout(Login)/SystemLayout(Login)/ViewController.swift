//
//  ViewController.swift
//  SystemLayout(Login)
//
//  Created by Derrick on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {

    //----------
    // Properties
    //----------
    @IBOutlet weak var txtUserId: UITextField!
    
    @IBOutlet weak var txtUserPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnOK(_ sender: UIButton) {
        if txtUserId.text == "aaa" && txtUserPassword.text == "1111" {
            
            // Share static 
            Share.userID = txtUserId.text!
            
            // segue connected
            self.performSegue(withIdentifier: "afterChecking", sender: self)
            
        }else{
            let userAlert = UIAlertController(title: "경고", message: "ID나 암호가 틀렸습니다.", preferredStyle: UIAlertController.Style.actionSheet)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            userAlert.addAction(onAction)
            present(userAlert, animated: true, completion: nil)
            
        }
    }
    
}

