//
//  MyFavouritesViewController.swift
//  ExampleOne
//
//  Created by Shaik Ghouse Basha on 24/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class MyFavouritesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var mTableView: UITableView!
    var sectionHeaders = ["Cricket", "MoviesStars", "Politics"]
    var sectionItems   = [
                            ["Sachin","Viru","Virat","Dhoni","Yuvi"],
                            ["Chiru","BalaKrishna","Nag",],
                            ["Modi","Jagan", "ChandraBabu"],
                         ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier:"xyz")
        mTableView.dataSource = self;
       let window = UIApplication.shared.delegate?.window
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int  {
        return sectionHeaders.count
    }
    
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    
    /*
     public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionHeaders.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "xyz")! as UITableViewCell
        cell.textLabel?.text = sectionHeaders[indexPath.row]
        return cell
    }*/
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionItems[section].count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "xyz")! as UITableViewCell
        cell.textLabel?.text = sectionItems[indexPath.section][indexPath.row]
        return cell
    }
    
    
    
    
}

