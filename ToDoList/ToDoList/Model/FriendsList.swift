//
//  FriendsList.swift
//  ToDoList
//
//  Created by Shaik Ghouse Basha on 30/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import Foundation

class FriendsdList {
    
    var first_name : String = ""
    var last_name  : String = ""
    var avatar     : String = ""
    
    init(fname : String, lname : String, favatar : String) {
        first_name = fname
        last_name  = lname
        avatar     = favatar
    }
    static func buildRecords(data : NSArray) -> [FriendsdList] {
        var friendsCollection = [FriendsdList]()
        for friends in data {
            if let friend = friends as? NSDictionary {
                friendsCollection.append(FriendsdList(fname: friend["first_name"] as! String,
                                                      lname: friend["last_name"] as! String,
                                                      favatar: friend["avatar"] as! String))
            }
        }
      return friendsCollection
    }
    
}
