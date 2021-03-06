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
    
    func testSeasonExistence() {
        XCTAssertNotNil(firstSeason)
    }
    
    // Given - When - Then
    func testSeason_AddEpisodes_ReturnsTheCorrectCountOfEpisods() {
        XCTAssertEqual(firstSeason.count, 0)
        
        firstSeason.add(episode: episode1FirstSeason)
        firstSeason.add(episode: episode1FirstSeason)
        XCTAssertEqual(firstSeason.count, 1)
        
        firstSeason.add(episode: episode2FirstSeason)
        firstSeason.add(episode: episode1SecondSeason)
        XCTAssertEqual(firstSeason.count, 2)
        
    }
    
    func testSeason_AddEpisodesInBatches_ReturnsTheCorrectCountOfEpisodes() {
        XCTAssertEqual(firstSeason.count, 0 )
        firstSeason.add(episodes: episode1FirstSeason, episode2FirstSeason, episode1SecondSeason)
        XCTAssertEqual(firstSeason.count, 2)
    }
    
    func testSeasonEquality() {
        // 1. Identidad
        XCTAssertEqual(firstSeason, firstSeason)
        
        // 2. Igualdad
        let  fakeSeason = Season(originallyAiredYear: "17/04/2011".getDateFromString(), numberSeason: 1, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_1)")!)
        XCTAssertEqual(fakeSeason, firstSeason)
        
        // 3. Desigualdad
        XCTAssertNotEqual(firstSeason, secondSeason)
    }
    
    func testSeasonHashable() {
        XCTAssertNotNil(firstSeason.hashValue)
    }
    
    func testSeasonComparison(){
        XCTAssertLessThan(firstSeason, secondSeason)
    }
   
}
