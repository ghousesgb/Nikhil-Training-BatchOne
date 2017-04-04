//
//  FriendDetailsViewController.swift
//  MyToDoList
//
//  Created by Shaik Ghouse Basha on 31/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class FriendDetailsViewController: UIViewController {
    var friend = FriendsList()
    @IBOutlet weak var mFriendImageView: UIImageView?
    @IBOutlet weak var mFriendFullName: UILabel?
    
    @IBOutlet weak var mScrollView: UIScrollView!
    @IBOutlet weak var mInfoView: UIView!
    @IBOutlet weak var mLookView: UIView!
    @IBOutlet weak var mAgeView: UIView!
    @IBOutlet weak var mAgeLabel: UILabel!
    @IBOutlet weak var mLookLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mFriendImageView?.imageFromServerURL(urlString: friend.avatar)
        mFriendFullName?.text = friend.first_name + " " + friend.last_name
        hideViews()
        mAgeView.isHidden = false
        mScrollView.contentSize = CGSize(width: mScrollView.frame.size.width, height: mScrollView.frame.size.height * 3)
    }

    @IBAction func StepperAction(_ sender: UIStepper) {
       mAgeLabel.text = sender.value.description
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideViews() {
        mAgeView.isHidden = true
        mLookView.isHidden = true
        mInfoView.isHidden = true
    }
    
    @IBAction func SegmentAction(_ sender: UISegmentedControl) {
        hideViews()
        switch sender.selectedSegmentIndex {
        case 0:
            mAgeView.isHidden = false
        case 1:
            mLookView.isHidden = false
        case 2:
            mInfoView.isHidden = false
        default:
            mAgeView.isHidden = false

        }
    }
    
    @IBAction func lookSliderAction(_ sender: UISlider) {
        let value = sender.value
        if value >= 0.7 {
            mLookLabel.text = "Handsome"
        }else if value >= 0.4 {
            mLookLabel.text = "Fair"
        }else {
            mLookLabel.text = "Ugly"
        }
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
