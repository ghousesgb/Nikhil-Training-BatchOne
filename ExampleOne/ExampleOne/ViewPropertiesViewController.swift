//
//  ViewPropertiesViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 20/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class ViewPropertiesViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
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
    /*@IBAction func showDetailsButtonAction(_ sender: UIButton) {
        
     //hidden property is not supported for animations
     UIView.animate(withDuration: 1.5) {
            self.popupView.isHidden = false
        }
        
    }
    @IBAction func continueButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 1.5) {
            self.popupView.isHidden = true
        }
    }*/
    
    @IBAction func showDetailsButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.popupView.alpha = 1
            self.popupView.layer.shadowOpacity = 1
        }
        
    }
    @IBAction func continueButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration:0.1) {
            self.popupView.alpha = 0
        }
    }
    
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
