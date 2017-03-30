//
//  FriendsListTableViewController.swift
//  MyToDoList
//
//  Created by Shaik Ghouse Basha on 29/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit
import SwiftSpinner

class FriendsListTableViewController: UITableViewController {
    var mFriendsList = [FriendsList]()
    var pageNo = 1
    var totalPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButtonAction(nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mFriendsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell-friend", for: indexPath)
        let friend = mFriendsList[indexPath.row]
        cell.textLabel?.text       = friend.first_name
        cell.detailTextLabel?.text =  friend.last_name
        return cell
    }
    @IBAction func nextButtonAction(_ sender: UIBarButtonItem?) {
        if(totalPage>=pageNo) {
            let urlWithPage = "https://reqres.in/api/users?page=\(pageNo)"
            SwiftSpinner.show("Loading Page No ... \(pageNo)")

            makeAPICall(url: urlWithPage)
            pageNo += 1
        }else {
            let alert = UIAlertController(title: "", message: "End of Page", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension FriendsListTableViewController {
    func makeAPICall(url : String)  {
        var config      :URLSessionConfiguration!
        var urlSession  :URLSession!
        
        config = URLSessionConfiguration.default
        urlSession = URLSession(configuration: config)
        
        let callURL = URL.init(string: url)
        let request = URLRequest.init(url: callURL!)
        
        let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
            SwiftSpinner.hide()
            if error != nil{
                return
            }
            do {
                let resultJson = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                print(resultJson)
                self.totalPage = resultJson?["total_pages"] as! Int
                let dataArray  = resultJson?["data"] as! NSArray
                
                let fList = FriendsList.buildRecord(data: dataArray)
                self.mFriendsList += fList
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("Error -> \(error)")
            }
        }
        dataTask.resume()
    }

}
