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
    var localHouses: [House]!
    
    override func setUp() {
        localHouses = Repository.local.houses
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalRepositoryExistence(){
        XCTAssertNotNil(Repository.local)
    }

    func testLocalRepositoryHousesCreation() {
        XCTAssertNotNil(localHouses)
        
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositoryReturnsSOrtedArrayOfHouses(){
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnsHousesByNameCaseInsensitively() {
        let stark = Repository.local.house(named: "sTaRk")
        
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testLocalRepositoryHouseFiltering() {
        var filtered = Repository.local.houses(filteredBy: {$0.count == 1})
        XCTAssertEqual(filtered.count, 1)
        
        filtered = Repository.local.houses(filteredBy: {$0.count == 100})
        XCTAssertTrue(filtered.isEmpty)
    }
}
