//
//  LoginViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 2/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var mMessageLabel: UILabel!
    @IBOutlet weak var mUserNameTextField: UITextField!
    @IBOutlet weak var mPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginButtonAction(_ sender: UIButton) {
        let username = mUserNameTextField.text
        let password = mPasswordTextField.text
        //username == "INDIA" || username == "india") &&
        if password == "1234" {
            mMessageLabel.text = "WELCOME"
            
            let homeVC  =   self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            homeVC.mTitleString = username
            self.navigationController?.pushViewController(homeVC, animated: true)
            
        }else {
            mPasswordTextField.text = ""
            mUserNameTextField.becomeFirstResponder()
            
            let alertView = UIAlertController.init(title: "Login Error", message: "Password is incorrect", preferredStyle: .alert)
            let okAction  = UIAlertAction (title: "Ok", style: .default, handler: nil)
            alertView.addAction(okAction)
            
            present(alertView, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
