//
//  ImageLoader.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 17/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ImageLoader {
        
    let imageCache = NSCache<AnyObject, AnyObject>()
    var imageURL: URL?

    func loadImageWithUrl(_ url: URL, profileImage: @escaping (_ : UIImage) -> Void) {

        imageURL = url

        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            profileImage(imageFromCache)
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if error != nil, response == nil {
                print(error as Any)
            }

            DispatchQueue.main.async(execute: {

                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {

                    if self.imageURL == url {
                        profileImage(imageToCache)
                    }

                    self.imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
            })
        }).resume()
    }
}
