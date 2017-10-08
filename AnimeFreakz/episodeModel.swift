/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class episodeModel {
	public var episodes : Array<Episodes>?
	public var desc : Array<Desc>?
	public var status : Array<Status>?
	public var released : Array<Released>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let episodeModel_list = episodeModel.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of episodeModel Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [episodeModel]
    {
        var models:[episodeModel] = []
        for item in array
        {
            models.append(episodeModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let episodeModel = episodeModel(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: episodeModel Instance.
*/
	required public init?(dictionary: NSDictionary) {

        if (dictionary["episodes"] != nil) { episodes = Episodes.modelsFromDictionaryArray(array: dictionary["episodes"] as! NSArray) }
        if (dictionary["desc"] != nil) { desc = Desc.modelsFromDictionaryArray(array: dictionary["desc"] as! NSArray) }
        if (dictionary["status"] != nil) { status = Status.modelsFromDictionaryArray(array: dictionary["status"] as! NSArray) }
        if (dictionary["released"] != nil) { released = Released.modelsFromDictionaryArray(array: dictionary["released"] as! NSArray)
        }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()


		return dictionary
	}

}
