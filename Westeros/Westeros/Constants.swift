//
//  Constants.swift
//  Westeros
//
//  Created by German Hernandez on 24/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import Foundation

enum Constants {
    static let AppTitle = "Westeros"
    
    static let HouseDidChangeNotificationName = "HouseDidChange"
    static let SeasonDidChangeNotificationName = "SeasonDidChange"
    static let EpisodeDidChangeNotificationName = "EpisodeDidChange"
    static let MemberDidChangeNotificationName = "MemberDidChange"
    
    static let HouseKey = "HouseKey"
    static let SeasonKey = "SeasonKey"
    
    static let LastHouseKey = "LastHouseKey"
    static let LastSeasonKey = "LastSeasonKey"
    static let LastTapSelected = "LastTapSelected"
    
    static let PrefixSeason = "Season"
    static let PrefixEpisode = "Episode"
    
    static let RecapNotFound = "Have Not Found Any Recap"
    
    static let HouseCellId = "HouseCell"
    static let SeasonCellId = "SeasonCell"
    static let EpisodeCellId = "EpisodeCell"
    static let MemberCellId = "MemberCell"
    
    static let titleWiki = "Wiki"
    static let titleMembers = "Members"
    static let titleEpisodes = "Episodes"
    static let titleSeasons = "Seasons"
    static let titleHouses = "Houses"
    static let titleHouse = "House"
    
}

enum tabBarIndex{
    static let seasons: Int = 0
    static let houses: Int = 1
}

enum housesNames{
    static let stark = "Stark"
    static let lannister = "Lannister"
    static let targaryen = "Targaryen"
}
