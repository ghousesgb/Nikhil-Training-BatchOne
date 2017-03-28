//
//  ViewController.swift
//  MyToDoList
//
//  Created by Shaik Ghouse Basha on 28/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mToDoList = [ToDoList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mToDoList = ToDoList.getData()
    }
}

extension ViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mToDoList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell-todo", for: indexPath)
        let item = mToDoList[indexPath.row]
        cell.textLabel?.text = item.title
        
        let accessory : UITableViewCellAccessoryType = item.done ? .checkmark : .none
        //Ternary Operator
        // <condition> ? <if true> : <if flase>
        // ? is like if
        // : is like else
        cell.accessoryType = accessory
        
       /* if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.darkGray
        }else {
            cell.backgroundColor = UIColor.lightGray
        }*/
        return cell
    }
    
    
 }

extension ViewController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = mToDoList[indexPath.row]
        item.done = !item.done
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}


