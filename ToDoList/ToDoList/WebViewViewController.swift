//
//  WebViewViewController.swift
//  ToDoList
//
//  Created by Shaik Ghouse Basha on 7/4/17.
//  Copyright © 2017 Shaik Ghouse Basha. All rights reserved.
//

import UIKit
import SwiftSpinner

class WebViewViewController: UIViewController {

    @IBOutlet weak var mWebView: UIWebView!
    var webSiteName = ""
    var webURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        webSiteName = UserDefaults.standard.value(forKey: "WEB-SITE-NAME") as! String
        mWebView.delegate = self
        
        switch webSiteName {
        case "Google":
            webURL = "https://www.google.com"
        case "Facebook":
            webURL = "https://www.facebook.com"
        case "Twitter":
            webURL = "https://www.twitter.com"
        case "YouTube":
            webURL = "https://www.youtube.com"
        default:
            webURL = "https://www.google.com"
        }
        
        mWebView.loadRequest(URLRequest(url: URL(string: webURL)!))
    }
}

extension WebViewViewController : UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        SwiftSpinner.show("Loading \(webSiteName)")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SwiftSpinner.hide()
    }
}
