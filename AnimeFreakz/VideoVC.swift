//
//  VideoVC.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit

class VideoVC: UIViewController, UIWebViewDelegate{
    @IBOutlet weak var webView: UIWebView!
    var streamURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.streamURL = "https://streamango.com/embed/endrtcmbfsqofokt"
        let url = URL(string: self.streamURL);
        let requestObj = URLRequest(url:url!);
        webView.loadRequest(requestObj);

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func reloadVideoLink(_ sender: UIButton) {
        let url = URL(string: self.streamURL);
        let requestObj = URLRequest(url:url!);
        webView.loadRequest(requestObj);

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if(request.url == URL(string: self.streamURL)){
            return true}
        else {
            return false
        }
    }
    


}
