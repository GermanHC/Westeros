//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by German Hernandez on 20/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalRepositoryExistence(){
        XCTAssertNotNil(Repository.local)
    }

    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        
        XCTAssertNotNil(houses)
        
        XCTAssertGreaterThan(houses.count, 0)
    }
}
