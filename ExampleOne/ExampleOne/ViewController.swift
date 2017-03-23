//
//  ViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 1/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       performSegue(withIdentifier: "showPopup", sender: nil)
    }

    @IBAction func showPopoButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "showPopup", sender: nil)

    }



}

