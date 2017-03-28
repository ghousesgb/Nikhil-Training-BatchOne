//
//  ToDoItems.swift
//  MyToDoList
//
//  Created by Shaik Ghouse Basha on 28/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import Foundation

class ToDoList {
    var title  : String
    var done : Bool
    
    public init(title : String) {
        self.title   = title
        self.done  = false
    }
    public static func getData() -> [ToDoList] {
        return [
            ToDoList(title: "Milk"),
            ToDoList(title: "Sugar"),
            ToDoList(title: "Water"),
            ToDoList(title: "Boost")
        ]
    }
}
