//
//  HomeViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 4/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var mTitleString:String!
    @IBOutlet weak var mWelcomeLabel: UILabel!
    @IBOutlet weak var mMenuIItemsLabel: UILabel!
    let menus       = MyDataSource().menuNames
    let menuPrice   = MyDataSource().menuPrice
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mWelcomeLabel.text = "WELCOME " + mTitleString
        mMenuIItemsLabel.text = menus.joined(separator: "\n\n")
        print(menus)
    }
    @IBAction func logoutButtonAction(_ sender: UIButton) {
        
        let actionView = UIAlertController.init(title: "Logout", message: "Are you sure?", preferredStyle: .actionSheet)
        let yesAction = UIAlertAction (title: "Yes", style: .destructive) { (UIAlertAction) in
            UserDefaults.standard.setValue(nil, forKey: "username")
            let landingScreen = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "LandingScreen")
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
            appDelegate.window?.rootViewController = landingScreen
        }
        let noAction  = UIAlertAction (title: "No", style: .default, handler: nil)
       
        actionView.addAction(yesAction)
        actionView.addAction(noAction)
        present(actionView, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        menuCell.textLabel?.text        = menus[indexPath.row]
        menuCell.detailTextLabel?.text  = menuPrice[indexPath.row]
        return menuCell
    }
    
}
