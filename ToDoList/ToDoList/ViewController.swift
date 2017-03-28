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
        return mToDoItems.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell-todo", for: indexPath)
        
        let item = mToDoItems[indexPath.row]
        cell.textLabel?.text = item.title
        
        let accessory : UITableViewCellAccessoryType = item.done ? .checkmark : .none
        cell.accessoryType = accessory
        
        return cell
    }
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        mToDoItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
    }
}

extension ViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = mToDoItems[indexPath.row]
        item.done = !item.done
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
