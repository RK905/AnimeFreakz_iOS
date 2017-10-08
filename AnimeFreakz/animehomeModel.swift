//
//  animehomeModel.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/7/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//


import Foundation

/* For support, please feel free to contact me at https://www.linkedin.com/in/rayenkamta */

public class animeHomeModel {
    public var title : String?
    public var thumb : String?
    public var link : String?
    public var linkSD : String?
    public var genres : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let animeHomeModel_list = animeHomeModel.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of animeHomeModel Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [animeHomeModel]
    {
        var models:[animeHomeModel] = []
        for item in array
        {
            models.append(animeHomeModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let animeHomeModel = animeHomeModel(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: animeHomeModel Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        title = dictionary["Title"] as? String
        thumb = dictionary["Thumb"] as? String
        link = dictionary["Link"] as? String
        linkSD = dictionary["LinkSD"] as? String
        genres = dictionary["Genres"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.title, forKey: "Title")
        dictionary.setValue(self.thumb, forKey: "Thumb")
        dictionary.setValue(self.link, forKey: "Link")
        dictionary.setValue(self.linkSD, forKey: "LinkSD")
        dictionary.setValue(self.genres, forKey: "Genres")
        
        return dictionary
    }
    
}

