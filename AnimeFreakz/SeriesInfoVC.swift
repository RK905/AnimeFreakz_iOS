//
//  SeriesInfoVC.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout
import KRProgressHUD
class SeriesInfoVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    public var animeModel : animeHomeModel?
    public var seriModel : seriesModel?
    public var urlString : String?
    public var episodeMod : [Episodes] = []
    
    @IBOutlet weak var seriesImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seriesSummary: UITextView!
    @IBOutlet weak var seriesReleased: UILabel!
    @IBOutlet weak var seriesStatus: UILabel!
    @IBOutlet weak var seriesGenre: UILabel!
    @IBOutlet weak var seriesTitle: UILabel!
    let cellId = "EpisodeCell"
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register( nib, forCellWithReuseIdentifier: cellId)
        let layout = VegaScrollFlowLayout()
        self.collectionView.collectionViewLayout = layout
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: self.collectionView.frame.width, height: 30)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.preloadedInfo()
        self.loadSeriesInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {return episodeMod.count}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EpisodeCell
           cell.episodeTitle.text = episodeMod[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "playEpisode", sender: indexPath)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "playEpisode"{
            let selectedIndexPath = sender as? NSIndexPath
            let seriesVC = segue.destination as! VideoVC
            seriesVC.urlString = episodeMod[(selectedIndexPath?.row)!].href
        }
    }
    
    
    func preloadedInfo(){
        self.seriesTitle.text = animeModel?.title
        self.seriesImage.kf.setImage(with: URL(string: (animeModel?.thumb)!))
    }

    func loadSeriesInfo(){
         KRProgressHUD.show(withMessage: "Loading...")
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
                    self.seriModel = seriesModel(dictionary: json)!
                    self.episodeMod = (self.seriModel?.episodes)!
                    DispatchQueue.main.async(execute: {
                        self.seriesReleased.text = (self.seriModel?.released![0].content)!
                        self.seriesStatus.text = (self.seriModel?.status![0].content)!
                        self.seriesSummary.text = (self.seriModel?.desc![0].content)!
                        self.collectionView.reloadData()})
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
}
