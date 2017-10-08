//
//  NewsModel.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import Foundation


/* For support, please feel free to contact me at https://www.linkedin.com/in/rayenkamta */

public class NewsModel {
    public var title : String?
    public var body : String?
    public var article_url : String?
    public var article_img : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let NewsModel_list = NewsModel.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of NewsModel Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [NewsModel]
    {
        var models:[NewsModel] = []
        for item in array
        {
            models.append(NewsModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let NewsModel = NewsModel(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: NewsModel Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        title = dictionary["title"] as? String
        body = dictionary["body"] as? String
        article_url = dictionary["article_url"] as? String
        article_img = dictionary["article_img"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.body, forKey: "body")
        dictionary.setValue(self.article_url, forKey: "article_url")
        dictionary.setValue(self.article_img, forKey: "article_img")
        
        return dictionary
    }
    
}
