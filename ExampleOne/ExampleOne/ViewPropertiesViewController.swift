//
//  ViewPropertiesViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 20/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class ViewPropertiesViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       welcomeLabel.text = "Hi, Welcome to Everyone"
        
       let dummyLabel = view.viewWithTag(555) as! UILabel
        dummyLabel.text = "This is Ghouse S"
        
        
    }
    /*@IBAction func changeBlackBGColorButtonAction(_ sender: AnyObject) {
        UIView.animate(withDuration: 2.0) {
            self.view.backgroundColor = UIColor.black
        }
    }

    @IBAction func changeBGColorButtonAction(_ sender: UIButton) {
        view.backgroundColor = UIColor.red
        
    }
    
    @IBAction func changeOrangeBGColorButtonAction(_ sender: UIButton) {
        view.backgroundColor = UIColor.orange
    }*/
    
    @IBAction func changeBGColorButtonAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1.5) {
            switch sender.tag {
            case 111:
                self.view.backgroundColor = UIColor.red
            case 222:
                self.view.backgroundColor = UIColor.black
            case 333:
                self.view.backgroundColor = UIColor.orange
            default:
                print("its of no use")
            }
        }
        
    }
    
}
