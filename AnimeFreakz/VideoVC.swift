//
//  VideoVC.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit
import KRProgressHUD
class VideoVC: UIViewController, UIWebViewDelegate{
    @IBOutlet weak var webView: UIWebView!
    public var urlString : String?
    public var streamURL : String?
    public var steamModel : StreamEModel?
    public var linksDict : NSDictionary?
    public var linksArray : Array<String>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        // Do any additional setup after loading the view.
        self.loadSeriesInfo()
    }
    
    @IBAction func changeSource(_ sender: UIButton) {
    }
    
    @IBAction func reloadVideoLink(_ sender: UIButton) {
        let url = URL(string: self.streamURL!)
        let requestObj = URLRequest(url:url!)
        self.webView.loadRequest(requestObj)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if(request.url == URL(string: self.streamURL!)){
            return true}
        else {
            return false
        }
    }
    
    func loadSeriesInfo(){
         KRProgressHUD.show(withMessage: "Loading...")
        let Url = String(format: "http://acecinema.net/php/kissanime_ios.php")
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        let postString = "LinkIos=" + urlString! ;
        request.httpBody = postString.data(using: String.Encoding.utf8);
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                    print(json)
                    self.steamModel = StreamEModel(dictionary: json)!
                    self.linksDict = json
                    self.loadStreamArray()
                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        KRProgressHUD.dismiss()}
                }catch {
                    print(error)
                    KRProgressHUD.show(withMessage: "Error Loading")
                    DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                        KRProgressHUD.dismiss()}
                }
            }
            }.resume()
    }
    
    func loadStreamArray(){
        self.streamURL = self.steamModel?.openload
        let url = URL(string: self.streamURL!)
        let requestObj = URLRequest(url:url!)
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.webView.loadRequest(requestObj)}
    }

}
