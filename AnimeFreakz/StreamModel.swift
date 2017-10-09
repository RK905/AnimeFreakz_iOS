//
//  StreamModel.swift
//  AnimeFreakz
//
//  Created by Rayen Kamta on 10/8/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//


import Foundation

/* For support, please feel free to contact me at https://www.linkedin.com/in/rayenkamta */

public class StreamEModel {
    public var gstream : String?
    public var estream : String?
    public var mp4upload : String?
    public var openload : String?
    public var streamango : String?
    public var youtube : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let StreamEModel_list = StreamEModel.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of StreamEModel Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [StreamEModel]
    {
        var models:[StreamEModel] = []
        for item in array
        {
            models.append(StreamEModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let StreamEModel = StreamEModel(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: StreamEModel Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        gstream = dictionary["gstream"] as? String
        estream = dictionary["estream"] as? String
        mp4upload = dictionary["mp4upload"] as? String
        openload = dictionary["openload"] as? String
        streamango = dictionary["streamango"] as? String
        youtube = dictionary["youtube"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.gstream, forKey: "gstream")
        dictionary.setValue(self.estream, forKey: "estream")
        dictionary.setValue(self.mp4upload, forKey: "mp4upload")
        dictionary.setValue(self.openload, forKey: "openload")
        dictionary.setValue(self.streamango, forKey: "streamango")
        dictionary.setValue(self.youtube, forKey: "youtube")
        
        return dictionary
    }
    
}

