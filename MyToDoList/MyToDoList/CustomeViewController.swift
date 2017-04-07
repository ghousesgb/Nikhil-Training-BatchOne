//
//  CustomeViewController.swift
//  MyToDoList
//
//  Created by Shaik Ghouse Basha on 5/4/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit
import SwiftSpinner
import  moa

let apiURL = "https://jsonplaceholder.typicode.com/photos"

class CustomeViewController: UIViewController {
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    let mView = UIView()
    let labelArray = ["One","Two","Three","Four","Five","Six","Seven"]
    var mImageList = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAPICall(url: apiURL)
        SwiftSpinner.show("Loading Images")
    }
}

extension CustomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mImageList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        
        let imageView = cell.viewWithTag(2) as! UIImageView
        let dict = mImageList[indexPath.row] as! NSDictionary
        imageView.moa.url = dict["thumbnailUrl"] as? String
        
        let button = cell.viewWithTag(3) as! UIButton
        let buttonTitle = "\(dict["id"]!)" //as! String
        button.setTitle(buttonTitle, for: .normal)
        
        return cell
        
    }
}
extension CustomeViewController {
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
                self.mImageList = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                
                DispatchQueue.main.async {
                    self.mCollectionView.reloadData()
                }
                
            } catch {
                print("Error -> \(error)")
            }
        }
        dataTask.resume()
    }
    
}
