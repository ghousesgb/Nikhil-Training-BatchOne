//
//  ViewController.swift
//  MyToDoList
//
//  Created by Shaik Ghouse Basha on 28/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mWebSiteTableView: UITableView!
    var mToDoList = [ToDoList]()
    let mWebSiteList = ["Google", "Yahoo", "Facebook", "Twitter"]
    override func viewDidLoad() {
        super.viewDidLoad()
        mToDoList = ToDoList.getData()
    }
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Item", message: "Enter Title of the Item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            if let tfText = alert.textFields?[0].text, tfText.characters.count > 0 {
                self.mToDoList.append(ToDoList(title: tfText))
                self.myTableView.insertRows(at: [IndexPath(row:self.mToDoList.count-1, section:0)], with: .automatic)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myTableView {
            return mToDoList.count
        }else {
            return mWebSiteList.count
        }
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == myTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell-todo", for: indexPath)
            let item = mToDoList[indexPath.row]
            cell.textLabel?.text = item.title
            
            let accessory : UITableViewCellAccessoryType = item.done ? .checkmark : .none
            //Ternary Operator
            // <condition> ? <if true> : <if flase>
            // ? is like if
            // : is like else
            cell.accessoryType = accessory
            
           /*if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor.darkGray
            }else {
                cell.backgroundColor = UIColor.lightGray
            }*/
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell-website", for: indexPath)
            let item = mWebSiteList[indexPath.row]
            cell.textLabel?.text = item
            return cell
        }
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        mToDoList.remove(at: indexPath.row)  // Deleting element from the array
        tableView.deleteRows(at: [indexPath], with: .automatic) // delete row from the tableview
    }
 }

extension ViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == myTableView {
            let item = mToDoList[indexPath.row]
            item.done = !item.done // ! (Not)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }else {
            UserDefaults.standard.setValue(mWebSiteList[indexPath.row], forKey: "WEB_SITE")
        }
    }
}


