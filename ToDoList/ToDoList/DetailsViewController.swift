//
//  DetailsViewController.swift
//  ToDoList
//
//  Created by Shaik Ghouse Basha on 1/4/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var mFriendsFullName: UILabel!
    @IBOutlet weak var mFriendImageView: UIImageView!
    
    @IBOutlet weak var mAgeView: UIView!
    @IBOutlet weak var mLooksView: UIView!
    @IBOutlet weak var mInfoView: UIView!
    
    @IBOutlet weak var mAgeLabel: UILabel!
    @IBOutlet weak var mLooksLabel: UILabel!
    
    var mFriend = FriendsdList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mFriendsFullName.text = mFriend.first_name + " " + mFriend.last_name
        mFriendImageView.imageFromServerURL(urlString: mFriend.avatar)
        hideViews()
        mAgeView.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func hideViews() {
        mAgeView.isHidden = true
        mLooksView.isHidden = true
        mInfoView.isHidden = true
    }
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
    
        hideViews()
        switch sender.selectedSegmentIndex {
        case 0:
            mAgeView.isHidden = false
        case 1:
            mLooksView.isHidden = false
        case 2:
            mInfoView.isHidden = false
        default:
            mAgeView.isHidden = false
        }
        
        
    }
    @IBAction func ageSteeperAction(_ sender: UIStepper) {
        
        mAgeLabel.text = "Age : \(sender.value.description)"
        
    }
    @IBAction func looksSliderAction(_ sender: UISlider) {
        if sender.value >= 0.7 {
            mLooksLabel.text = "Handsome"
        }else if sender.value >= 0.4 {
            mLooksLabel.text = "Fair"
        }else {
            mLooksLabel.text = "Ugly"
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
