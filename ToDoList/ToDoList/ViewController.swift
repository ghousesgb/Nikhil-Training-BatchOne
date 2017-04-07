//
//  ViewController.swift
//  ToDoList
//
//  Created by Shaik Ghouse Basha on 27/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mToDoItems = [ToDoItems]()
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mWebSiteTableView: UITableView!
    
    let webSiteNames = ["Google","Facebook","Twitter","YouTube"]

    override func viewDidLoad() {
        super.viewDidLoad()
        mToDoItems = ToDoItems.getData()
    }
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New To-Do Item", message: "Enter title of the new item", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (_) in
            if let title = alert.textFields?[0].text, title.characters.count > 0 {
                self.mToDoItems.append(ToDoItems(title:title))
                self.myTableView.insertRows(at: [IndexPath(row:self.mToDoItems.count-1, section:0)], with: .top)            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myTableView {
            return mToDoItems.count
        }else {
            return webSiteNames.count
        }
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         if tableView == myTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell-todo", for: indexPath)
            
            let item = mToDoItems[indexPath.row]
            cell.textLabel?.text = item.title
            
            let accessory : UITableViewCellAccessoryType = item.done ? .checkmark : .none
            cell.accessoryType = accessory
            
            return cell
         }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell-website", for: indexPath)
            
            let item = webSiteNames[indexPath.row]
            cell.textLabel?.text = item
            return cell
        }
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if tableView == myTableView {
            mToDoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
}

extension ViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if tableView == myTableView {
            let item = mToDoItems[indexPath.row]
            item.done = !item.done
            tableView.reloadRows(at: [indexPath], with: .automatic)
         }else {
            UserDefaults.standard.setValue(webSiteNames[indexPath.row], forKey: "WEB-SITE-NAME")
        }
    }
}
