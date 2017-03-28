//
//  File.swift
//  DesignPattern
//
//  Created by Shaik Ghouse Basha on 27/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import Foundation
import UIKit
final class MySingleton { //final class will allow only once to iniltize it
    
    //can't init singleton
    private init() {}    // Only the class can use it, can't use from outside
    
    static let defaults: MySingleton = MySingleton() //can use the methods/varaible/constacts without creating objects
        // let xyz     : Int = 20;
    
    //Local Variable
    var name : String = "Demo"
    var GrandTotal : Double = 0.0
    var themeColor : UIColor = UIColor.clear
}
