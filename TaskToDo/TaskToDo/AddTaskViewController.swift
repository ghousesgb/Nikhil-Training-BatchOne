//
//  AddTaskViewController.swift
//  TaskToDo
//
//  Created by Shaik Ghouse Basha on 4/4/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit
import CoreData
class AddTaskViewController: UIViewController {
    
    
    
    @IBOutlet weak var mAddTaskTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTaskAction(_ sender: UIButton) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Task",
                                       in: managedContext)!
        
        let task = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        task.setValue(mAddTaskTF.text, forKeyPath: "name")
        
        // 4
        do {
            try managedContext.save()
            self.navigationController?.popViewController(animated: true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        } 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
