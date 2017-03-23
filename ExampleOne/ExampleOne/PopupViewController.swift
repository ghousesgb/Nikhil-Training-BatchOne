//
//  PopupViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 23/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func continueButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
