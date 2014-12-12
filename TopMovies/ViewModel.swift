//
//  ViewModel.swift
//  TopMovies
//
//  Created by Josh Brown on 12/10/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    @IBOutlet var moviesClient: MoviesClient!
    var movies: [Movie]?
    
    func fetchMovies(completion: () -> ()) {
        moviesClient.fetchMovies { movies in
            self.movies = movies
            completion()
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func titleForItemAtIndexPath(indexPath: NSIndexPath) -> String {
        return movies?[indexPath.row].title ?? ""
    }
}
