//
//  SecondViewController.swift
//  DesignPattern
//
//  Created by Shaik Ghouse Basha on 25/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mNameLabel: UILabel!
    @IBOutlet weak var secondVCLabel: UILabel!
    
    override func viewDidLoad() { //called only once when u open the VC
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: MyNotifications.themeOrangeBroadcast, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(defaultHandleNotification), name: MyNotifications.defaultBroadcast, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mNameLabel.text = MySingleton.defaults.name
    }
    
    func handleNotification() {
        view.backgroundColor = UIColor.green
        secondVCLabel.text = "Hai Green Theme is seleceted using Notificaiton"
    }
    func defaultHandleNotification() {
        view.backgroundColor = UIColor.white
        secondVCLabel.text = "Second Controller for MagicBox View"
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

