//
//  Constants.swift
//  Darth Vader From Flickr
//
//  Created by Ashutosh Kumar Sai on 16/12/16.
//  Copyright © 2016 Ashish Rajendra Kumar Sai. All rights reserved.
//

import Foundation

struct Constants {
    
    struct flickr {
       static let baseURL = "https://api.flickr.com/services/rest/"
        
    }
    
    struct keyValues {
       static let MethodUsed = "method"
       static let Key = "api_key"
       static let Gallery = "gallery_id"
       static let Extras = "extras"
       static let Format = "format"
       static let NoJSONCallBack = "nojsoncallback"
    }
    
    struct values {
        static let Method = "flickr.galleries.getPhotos"
        static let myKey = "91241217ac800f61e5ed9888ba46e2ee"
        static let galID = "72157645788507706"
        static let extra = "url_m"
        static let format = "json"
        static let DisableJson = "1"
    }
}
