//
//  ViewController.swift
//  Darth Vader From Flickr
//
//  Created by Ashutosh Kumar Sai on 16/12/16.
//  Copyright © 2016 Ashish Rajendra Kumar Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextImageButton: UIButton!
   
    
    @IBAction func gettheimages(_ sender: Any) {
        print("I am in gettheImage method")
        
        UseTheApi()
    }

    
    func UseTheApi()
    {
        print("Entered in Usetheapi")
        let darthVaderParameter = [
            Constants.keyValues.MethodUsed : Constants.values.Method,
            Constants.keyValues.Extras : Constants.values.extra,
            Constants.keyValues.Key: Constants.values.myKey,
            Constants.keyValues.Format : Constants.values.format,
            Constants.keyValues.Gallery: Constants.values.galID,
            Constants.keyValues.NoJSONCallBack: Constants.values.DisableJson
        ]
        let darthVaderURl = Constants.flickr.baseURL + escapedURL(darthVaderParameter: darthVaderParameter as [String : AnyObject])
        let imageURl = URL(string: darthVaderURl)
        let request = URLRequest(url: imageURl!)
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error)
            in
            
             print(data)
            if error == nil {
                
                if let data = data {
                    
                    let parsedResult: [String:AnyObject]!
                    do {
                        parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
                    } catch {
                        print("Could not parse the data as JSON: '\(data)'")
                        return
                    }
                    
                    if let jsondictionary = parsedResult["photos"] as? [String: AnyObject], let jsonarray = jsondictionary["photo"] as? [[String: AnyObject]]{
                    let randomentry = Int (arc4random_uniform(UInt32(jsonarray.count)))
                        let finalentry = jsonarray[randomentry] as [String: AnyObject]
                        
                      if let randomURl = finalentry["url_m"] as? String, let randomTitle = finalentry["title"] as? String
                      {
                        let useImage = URL(string: randomURl)
                        if let imageData = try? Data(contentsOf: useImage!)
                        {
                            performUIUpdatesOnMain {
                                self.imageView.image = UIImage(data: imageData)
                                self.headerTitle.text = randomTitle
                               
                                
                            }
                        }
                        }
                        
                    }
                    
                   
                }
            }
        }
        task.resume()
                }
                
    
   
    


    
    func escapedURL(darthVaderParameter: [String: AnyObject]) -> String {
        
        print("Entered in escapedURL")
        if darthVaderParameter.isEmpty {
            return ""
        }
        else {
            
        
        var finalURl = [String]()
        
        for (key, value) in darthVaderParameter
        {
            print("Entered in forloop")
            let convertingInString = "\(value)"
            
            let escapedValue = convertingInString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            
            finalURl.append(key + "=" + escapedValue!)
        }
            return "?\(finalURl.joined(separator: "&"))"
        }
        
       
    }
    
}

