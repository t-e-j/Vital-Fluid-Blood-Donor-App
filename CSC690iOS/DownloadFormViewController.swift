//
//  DownloadFormViewController.swift
//  CSC690iOS
//
//  Created by Tejasvi Belsare on 12/13/18.
//  Copyright © 2018 Tejasvi Belsare. All rights reserved.
//

import UIKit
import WebKit


class DownloadFormViewController : UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "blood_donation_form", ofType: "pdf")
       
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
}

