//
//  FriendsList.swift
//  MyToDoList
//
//  Created by Shaik Ghouse Basha on 29/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import Foundation

class FriendsList {
    var first_name  : String = ""
    var last_name   : String = ""
    var avatar      : String = ""
    
   
    init(fname : String, lname : String, favatar : String) {
        first_name  = fname
        last_name   = lname
        avatar      = favatar
    }
    static func buildRecord(data : NSArray) -> [FriendsList] {
        var friendCollection = [FriendsList]()
        for friends in data {
            if let friend = friends as? NSDictionary {
                friendCollection.append(FriendsList(fname: friend["first_name"] as! String,
                                                    lname: friend["last_name"] as! String,
                                                    favatar: friend["avatar"] as! String))
            }
        }
        return friendCollection
    }
    
    
}
