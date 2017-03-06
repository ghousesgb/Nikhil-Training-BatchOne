//
//  HomeViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 4/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return menus.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let menuCell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        menuCell.textLabel?.text        = menus[indexPath.row]
        menuCell.detailTextLabel?.text  = menuPrice[indexPath.row]
    return menuCell
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
