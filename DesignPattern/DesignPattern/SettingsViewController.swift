//
//  SettingsViewController.swift
//  DesignPattern
//
//  Created by Shaik Ghouse Basha on 25/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func OrangeThemeButtonAction(_ sender: UIButton) {
        NotificationCenter.default.post(name:MyNotifications.themeOrangeBroadcast, object:nil)
    }
    
    @IBAction func defaultThemeButtonAction(_ sender: UIButton) {
        NotificationCenter.default.post(name:MyNotifications.defaultBroadcast, object:nil)
    }
}
