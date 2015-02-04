//
//  ViewModelTests.swift
//  TopMovies
//
//  Created by Josh Brown on 2/3/15.
//  Copyright (c) 2015 Roadfire Software. All rights reserved.
//

import UIKit
import XCTest

class ViewModelTests: XCTestCase {

    func testTitleForItemAtIndexPath() {
        let viewModel = ViewModel()
        viewModel.movies = [Movie(title: "Fury"), Movie(title: "John Wick")]
        
        let title = viewModel.titleForItemAtIndexPath(NSIndexPath(forRow: 1, inSection: 0))
        XCTAssertEqual("John Wick", title, "title should be John Wick")
    }

    func testTitleForItemAtIndexPath_empty_movies() {
        let viewModel = ViewModel()
        let title = viewModel.titleForItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertEqual("", title, "title should be empty")
    }
}
