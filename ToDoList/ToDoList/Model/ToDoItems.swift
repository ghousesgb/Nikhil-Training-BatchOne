//
//  ToDoItems.swift
//  ToDoList
//
//  Created by Shaik Ghouse Basha on 27/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import Foundation

class ToDoItems {
    var title : String
    var done  : Bool
    
    public init(title : String) {
        self.title = title
        self.done  = false
    }
    public static func getData() -> [ToDoItems] {
        return [
            ToDoItems(title:"Milk"),
            ToDoItems(title:"Curd"),
            ToDoItems(title:"Dog Food"),
            ToDoItems(title:"Sugar"),
            ToDoItems(title:"Coke")
        ]
    }
}
