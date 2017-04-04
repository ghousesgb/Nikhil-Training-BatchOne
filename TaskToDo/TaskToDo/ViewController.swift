//
//  ViewController.swift
//  TaskToDo
//
//  Created by Shaik Ghouse Basha on 4/4/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var taskList = [NSManagedObject] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getData()
    }
    
    func getData() {
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Task")
        
        //3
        do {
            taskList = try context.fetch(fetchRequest)
            self.tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController  {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = taskList[indexPath.row]
        cell.textLabel?.text = task.value(forKey: "name") as? String
    return cell
    }
    
}

