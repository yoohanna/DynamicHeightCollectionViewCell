//
//  DVPImageView.swift
//  Repoul_iOS
//
//  Created by Nima Davarpanah on 4/10/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
class DVPImageView: UIImageView{
    var imageURLString: String?

    func loadImageUsingURLString(urlString: String){
        imageURLString = urlString
        let url = URL(string: urlString)
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as! UIImage? {
            self.image = imageFromCache
            return
        }
        if let imageURL = url{
            URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    if self.imageURLString == urlString{
                        self.image = imageToCache
                    }
                    
                    imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                }
            }).resume()
        }

    }
}
