//
//  MoviesClient.swift
//  TopMovies
//
//  Created by Josh Brown on 12/10/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import UIKit
import Alamofire

class MoviesClient: NSObject {
    func fetchMovies(completion: ([Movie]?) -> ()) {
        // fetch the data
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        
        Alamofire.request(.GET, urlString)
        .responseJSON { (request, response, JSON, error) -> Void in
            if error != nil {
                completion(nil)
                return
            }

            if let jsonDict = JSON as? NSDictionary {
                if let movieDicts = jsonDict.valueForKeyPath("feed.entry") as? [NSDictionary] {
                    let movies = movieDicts.map {
                        self.parseMovie($0)
                    }
                    completion(movies)
                    return
                }
            }
        }
    }
    
    func parseMovie(movie: NSDictionary) -> Movie {
        return Movie(title: movie.valueForKeyPath("im:name.label") as String)
    }
}
