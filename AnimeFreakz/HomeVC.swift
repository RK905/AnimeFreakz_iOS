//
//  HomeVC.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout
import KRProgressHUD

class HomeVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    var models:[NewsModel] = []
    let cellId = "HomeCell"
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register( nib, forCellWithReuseIdentifier: cellId)
        let layout = VegaScrollFlowLayout()
        self.collectionView.collectionViewLayout = layout
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: self.collectionView.frame.width, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        let navBackgroundImage:UIImage! = UIImage(named: "banner")
        self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage,
                                                                    for: .default)
        self.getJsonFromUrl()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        cell.configureWith(models[indexPath.row])
        return cell
    }
    
    func getJsonFromUrl(){
        KRProgressHUD.show(withMessage: "Loading...")
        //creating a NSURL
        let url = URL(string: Constants.homeNewsApi)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray {
                self.models = NewsModel.modelsFromDictionaryArray(array: jsonObj!)
                DispatchQueue.main.async(execute: {self.collectionView.reloadData()})
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    KRProgressHUD.dismiss()
                }
            }

        }).resume()
    }
    
    

}
