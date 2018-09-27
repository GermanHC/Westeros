//
//  EpisodeTests.swift
//  WesterosTests
//
//  Created by German Hernandez on 28/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {

    var firstSeason: Season!
    var secondSeason: Season!
    
    var episode1FirstSeason: Episode!
    var episode2FirstSeason: Episode!
    var episode1SecondSeason: Episode!
    var episode2SecondSeason: Episode!
    
    override func setUp() {
        firstSeason = Season(originallyAiredYear: "17/04/2011".getDateFromString(), numberSeason: 1, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_1)")!)
        
        episode1FirstSeason = Episode(overAllNumber: 1, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 1), originallyAiredDate: "17/04/2011".getDateFromString(), season: firstSeason, title: "Title1")
        
        episode2FirstSeason = Episode(overAllNumber: 2, inSeasonNumber: 2, recap: Utils.getRecap(recapEpisodeNum: 2), originallyAiredDate: "24/04/2011".getDateFromString(), season: firstSeason, title: "Title2")
        
        secondSeason = Season(originallyAiredYear: "17/04/2011".getDateFromString(), numberSeason: 2, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_2)")!)
        
        episode1SecondSeason = Episode(overAllNumber: 3, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 11), originallyAiredDate: "17/04/2011".getDateFromString(), season: firstSeason, title: "Title3")
        
        episode2SecondSeason = Episode(overAllNumber: 4, inSeasonNumber: 2, recap: Utils.getRecap(recapEpisodeNum: 12), originallyAiredDate: "24/04/2011".getDateFromString(), season: firstSeason, title: "Title4")
    }
    
    func testEpisodeExistence() {
        XCTAssertNotNil(episode1FirstSeason)
        
        XCTAssertNotNil(episode2SecondSeason)
    }
    
    func testEpisodeFullName() {
        XCTAssertEqual(episode1FirstSeason.fullName, "Episode 1")
        XCTAssertEqual(episode2FirstSeason.fullName, "Episode 2")
    }
    
    func testEpisodeEquality() {
        // 1. Identidad
        XCTAssertEqual(episode1FirstSeason, episode1FirstSeason)
        
        // 2. Igualdad
        let episode1FakeFirstSeason =  Episode(overAllNumber: 1, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 1), originallyAiredDate: "17/04/2011".getDateFromString(), season: firstSeason, title: "Title1")
        
        XCTAssertEqual(episode1FirstSeason, episode1FakeFirstSeason)
        
        // 3. Desigualdad
        XCTAssertNotEqual(episode1FirstSeason, episode2FirstSeason)
    }
    
    func testPersonComparison() {
        XCTAssertGreaterThan(episode2FirstSeason, episode1FirstSeason)
    }
}
