//
//  FriendsListViewController.swift
//  ToDoList
//
//  Created by Shaik Ghouse Basha on 30/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit

class FriendsListViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var mFriendsList = [FriendsdList]()
    var pageNo = 1
    var totalPages = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAPICalls(url: "https://reqres.in/api/users?page=\(pageNo)")
    }
}

extension FriendsListViewController : UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mFriendsList.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell-friend", for: indexPath)
        
        let friend = mFriendsList[indexPath.row]
        cell.textLabel?.text = friend.first_name
        cell.detailTextLabel?.text = friend.last_name
        return cell
    }
}

extension FriendsListViewController {
    func makeAPICalls(url : String) {
        var config      : URLSessionConfiguration
        var urlSession  : URLSession
        
        config      = URLSessionConfiguration.default
        urlSession  = URLSession(configuration: config)
        
        let callingURL = URL.init(string: url)
        let request    = URLRequest.init(url: callingURL!)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                return
            }
            do {
              let resultJson = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
              print(resultJson)
              self.totalPages = resultJson["total_pages"] as! Int
              let fList = FriendsdList.buildRecords(data: resultJson["data"] as! NSArray)
              self.mFriendsList += fList
                DispatchQueue.main.async {
                     self.myTableView.reloadData()
                }
            }catch {
                print("error")
            }
        }
        dataTask.resume()
    }
}
