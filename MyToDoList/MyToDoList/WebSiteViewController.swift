//
//  WebSiteViewController.swift
//  MyToDoList
//
//  Created by Shaik Ghouse Basha on 6/4/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit
import SwiftSpinner

class WebSiteViewController: UIViewController {
    
    @IBOutlet weak var mWebView: UIWebView!
    var webSiteName = ""
    var webSiteURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webSiteName = UserDefaults.standard.value(forKey: "WEB_SITE") as! String
        
        switch webSiteName {
        case "Google":
            webSiteURL = "https://www.google.com"
        case "Yahoo":
            webSiteURL = "https://www.yahoo.com"
        case "Facebook":
            webSiteURL = "https://www.facebook.com"
        case "Twitter":
            webSiteURL = "https://www.twitter.com"
        default:
            webSiteURL = "https://www.google.com"
        }
        
        mWebView.loadRequest(URLRequest(url: URL(string: webSiteURL)!))
    }
}

extension WebSiteViewController : UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        SwiftSpinner.show("Loading \(webSiteName)")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SwiftSpinner.hide()
    }
}
