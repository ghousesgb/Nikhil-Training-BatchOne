//
//  FriendsListViewController.swift
//  ToDoList
//
//  Created by Shaik Ghouse Basha on 30/3/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit
import SwiftSpinner
import moa

class FriendsListViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var mFriendsList = [FriendsdList]()
    var pageNo = 1
    var totalPages = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButtonAction(nil)
    }
    
    @IBAction func nextButtonAction(_ sender: UIBarButtonItem?) {
        if(totalPages>=pageNo) {
            makeAPICalls(url: "https://reqres.in/api/users?page=\(pageNo)")
            SwiftSpinner.show("Loading Page \(pageNo)")
            pageNo += 1
        }else {
            let alert = UIAlertController(title: "Sorry", message: "End of Pages", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let detailVC        = segue.destination as? DetailsViewController
            let friendRecord    = sender as? FriendsdList
            detailVC?.mFriend   = friendRecord!
        }
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
        cell.imageView?.moa.url = friend.avatar
        //cell.imageView?.imageFromServerURL(urlString: friend.avatar)
        return cell
    }
}

extension FriendsListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let friend = mFriendsList[indexPath.row]
         performSegue(withIdentifier: "showDetails", sender: friend)
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
            DispatchQueue.main.async {
                SwiftSpinner.hide()
            }
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

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        self.image = nil
        // check for cache
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
