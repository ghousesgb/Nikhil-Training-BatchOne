//
//  AlbumViewController.swift
//  ToDoList
//
//  Created by Shaik Ghouse Basha on 6/4/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit
import SwiftSpinner

let apiURL = "https://jsonplaceholder.typicode.com/photos"

class AlbumViewController: UIViewController {

    @IBOutlet weak var mCollectionView: UICollectionView!
    
    /*let albumArray = ["One", "Two", "Three", "Four", "Five","One", "Two", "Three", "Four", "Five","One", "Two", "Three", "Four", "Five","One", "Two", "Three", "Four", "Five","One", "Two", "Three", "Four", "Five"]*/
    
    var albumArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftSpinner.show("Loading")
        makeAPICalls(url: apiURL)
    }
}

extension AlbumViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell-album", for: indexPath) as UICollectionViewCell
        
        
        let dict = albumArray[indexPath.row] as! NSDictionary
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.moa.url = dict["thumbnailUrl"] as? String
        
        let label  = cell.viewWithTag(2) as! UILabel
        label.text = "\(dict["id"]!)"
        
        
        /*let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: albumArray[indexPath.row])
        
        let label  = cell.viewWithTag(2) as! UILabel
        label.text = albumArray[indexPath.row]*/
        
        return cell
    }
}

extension AlbumViewController {
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
                let resultJson = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                
                self.albumArray = resultJson
                
                DispatchQueue.main.async {
                    self.mCollectionView.reloadData()
                }
            }catch {
                print("error")
            }
        }
        dataTask.resume()
    }

}

