//
//  UIImageView+Async.swift
//  TopMovies
//
//  Created by Josh Brown on 12/18/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    func loadFromURL(url: NSURL, callback: (UIImage)->()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            let imageData = NSData(contentsOfURL: url)
            if let data = imageData {
                dispatch_async(dispatch_get_main_queue(), {
                    if let image = UIImage(data: data) {
                        callback(image)
                    }
                })
            }
        })
    }
    
    func loadFromURLString(urlString: String) {
        Alamofire.request(.GET, urlString).response { (request, response, data, error) in
            if let imageData = data as? NSData {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if let image = UIImage(data: imageData) {
                        self.image = image
                    }
                })
            }
        }
    }
    
//    func loadFromURLString(urlString: String) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//            Alamofire.request(.GET, urlString)
//                .response { (request, response, data, error) in
//                    if let imageData = data as? NSData {
//                        dispatch_async(dispatch_get_main_queue(), {
//                            if let image = UIImage(data: imageData) {
//                                self.image = image
//                            }
//                        })
//                    }
//            }
//        }
//    }
}