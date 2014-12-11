//
//  MoviesClient.swift
//  TopMovies
//
//  Created by Josh Brown on 12/10/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {
    func fetchMovies(completion: ([NSDictionary]?) -> ()) {
        // fetch the data
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let url = NSURL(string: urlString)!
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                completion(nil)
                return
            }
            
            // TODO: check the response status code...
            
            var jsonError: NSError?
            if let json = NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments, error: &jsonError) as? NSDictionary {
                if let movies = json.valueForKeyPath("feed.entry") as? [NSDictionary] {
                    completion(movies)
                    return
                }
            }
        })
        
        task.resume()
    }
}
