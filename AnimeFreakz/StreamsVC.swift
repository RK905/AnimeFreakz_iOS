//
//  StreamsVC.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout
import KRProgressHUD

class StreamsVC: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var models:[animeHomeModel] = []
    var filtered:[animeHomeModel] = []
    let cellId = "AnimeCell"
    var searchActive : Bool = false
    
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
        getJsonFromUrl();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        DispatchQueue.main.async(execute: {
            self.searchBar.endEditing(true)
            self.collectionView.reloadData()})
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = true;
        self.searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if((searchText.count) > 0 ){
            self.filtered = models.filter {
                guard let name = $0.title else {
                    return false
                }
                return name.contains(searchText)
            }
            if(self.filtered.count == 0){
                self.searchActive = false;
            } else {
                self.searchActive = true;
            }
            DispatchQueue.main.async(execute: {self.collectionView.reloadData()})
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(self.searchActive){
            return filtered.count
        }else {
            return models.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AnimeCell
        if(self.searchActive){
            cell.configureWith(filtered[indexPath.row])
        }else {
            cell.configureWith(models[indexPath.row])}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         self.performSegue(withIdentifier: "seriesInfo", sender: indexPath)
  
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "seriesInfo"{
            let selectedIndexPath = sender as? NSIndexPath
            let seriesVC = segue.destination as! SeriesInfoVC
            seriesVC.animeModel = models[(selectedIndexPath?.row)!]
        }
    }
    
    
    func getJsonFromUrl(){
        KRProgressHUD.show(withMessage: "Loading...")
        //creating a NSURL
        let url = URL(string: Constants.homeApi)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: url!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray {
                self.models = animeHomeModel.modelsFromDictionaryArray(array: jsonObj!)
                DispatchQueue.main.async(execute: {self.collectionView.reloadData()})
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    KRProgressHUD.dismiss()
                }
            }
            
        }).resume()
    }
    
    

}
