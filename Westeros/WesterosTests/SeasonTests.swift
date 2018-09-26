//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by German Hernandez on 26/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {

    var firstSeason: Season!
    var secondSeason: Season!
    var thirdSeason: Season!
    
    override func setUp() {
        
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(firstSeason)
    }
 
}
