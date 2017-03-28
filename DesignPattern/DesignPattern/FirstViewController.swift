//
//  FirstViewController.swift
//  DesignPattern
//
//  Created by Shaik Ghouse Basha on 25/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var mNameLabel: UILabel!
    @IBOutlet weak var mNameTextField: UITextField!
    @IBOutlet weak var firstVCLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: MyNotifications.themeOrangeBroadcast, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(defaultHandleNotification), name: MyNotifications.defaultBroadcast, object: nil)

    }
    override func viewDidAppear(_ animated: Bool) {
        mNameLabel.text = MySingleton.defaults.name
        view.backgroundColor = MySingleton.defaults.themeColor
    }

    @IBAction func goButtonAction(_ sender: UIButton) {
        
        if (mNameTextField.text?.characters.count)! < 3 {
            let alertView    = UIAlertController.init(title: "", message: "Enter valid name", preferredStyle: .alert)
            let cancelAction = UIAlertAction (title: "Ok", style: .destructive, handler: nil)
            alertView.addAction(cancelAction)
            self.present(alertView, animated: true, completion: nil)
            return
        }
        
        MySingleton.defaults.name = mNameTextField.text!
        mNameLabel.text = MySingleton.defaults.name
    }
    func handleNotification() {
        view.backgroundColor = UIColor.green
        firstVCLabel.text = "Hai Green Theme is seleceted using Notificaiton"
    }
    func defaultHandleNotification() {
        view.backgroundColor = UIColor.white
        firstVCLabel.text = "FirstView Controller for HOME View"
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

