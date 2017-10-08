//
//  SeriesInfoVC.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit

class SeriesInfoVC: UIViewController {
    public var animeModel : animeHomeModel?
    public var epiModel : episodeModel?
    public var urlString : String?
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadSeriesInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadSeriesInfo(){
        let Url = String(format: "http://acecinema.net/php/kissanime_ios.php")
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        let postString = "Episodes=" + (animeModel?.link)!;
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
                    self.epiModel = episodeModel(dictionary: json)!
                }catch {
                    print(error)
                }
            }
            }.resume()
        }
}
