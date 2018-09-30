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
    var houseRepo: HouseFactory!
    
    var localSeason: [Season]!
    var seasonRepo: SeasonFactory!
    
    override func setUp() {
        houseRepo = HouseFactory()
        localHouses = houseRepo.getAll()
        seasonRepo = SeasonFactory()
        localSeason = seasonRepo.getAll()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalRepositoryExistence(){
        XCTAssertNotNil(houseRepo)
        XCTAssertNotNil(seasonRepo)
    }

    func testLocalRepositoryHousesCreation() {
        XCTAssertNotNil(localHouses)
        
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositorySeasonCreation() {
        XCTAssertNotNil(localSeason)
        
        XCTAssertEqual(localSeason.count, 7)
    }
    
    
    func testLocalRepositoryReturnsSortedArrayOfHouses(){
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnsSortedArrayOfSeason(){
        XCTAssertEqual(localSeason, localSeason.sorted())
    }
    
    func testLocalRepositoryReturnsHousesByNameCaseInsensitively() {
        let stark = houseRepo.get(named: "sTaRk")
        
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding =  houseRepo.get(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testLocalRepositoryReturnsHousesByNameEnum() {
        let stark = houseRepo.get(named: housesNames.stark)
        
        XCTAssertEqual(stark?.name, "Stark")
    }
    
    func testLocalRepositoryHouseFiltering() {
        var filtered =  houseRepo.getFiltered(filteredBy: {$0.count == 1})
        XCTAssertEqual(filtered.count, 1)
        
        filtered = houseRepo.getFiltered(filteredBy: {$0.count == 100})
        XCTAssertTrue(filtered.isEmpty)
    }
}
