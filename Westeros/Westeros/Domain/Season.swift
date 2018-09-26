//
//  Season.swift
//  Westeros
//
//  Created by German Hernandez on 26/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>

final class Season{
    // MARK: - Properties
    private var _name: String = ""
    let originallyAiredYear: Date
    let numberSeason: Int
    let wikiUrl: URL
    private var _episodes: Episodes
    
//    var sortedEpisodes: [Episode]{
//        return _episodes.sorted()
//    }
    
    // MARK: - Initialization
    init( originallyAiredYear: Date, numberSeason: Int, wikiUrl: URL) {
        self._name = Constants.PrefixSeason + String(numberSeason)
        self.originallyAiredYear = originallyAiredYear
        self.numberSeason = numberSeason
        self.wikiUrl = wikiUrl
         self._episodes = Episodes()
    }
}

extension Season: CustomStringConvertible{
    var description: String {
        return "\(Constants.PrefixSeason) \(String(numberSeason))"
    }
}
