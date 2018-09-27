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
    private(set) var name: String = ""
    let originallyAiredYear: Date?
    let numberSeason: Int
    let wikiUrl: URL
    private var _episodes: Episodes
    
    var sortedEpisodes: [Episode]{
        return _episodes.sorted()
    }
    
    // MARK: - Initialization
    init( originallyAiredYear: Date?, numberSeason: Int, wikiUrl: URL) {
        self.name = Constants.PrefixSeason + String(numberSeason)
        self.originallyAiredYear = originallyAiredYear
        self.numberSeason = numberSeason
        self.wikiUrl = wikiUrl
        self._episodes = Episodes()
    }
}

extension Season{
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        guard self == episode.season else {
            return
        }
        
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...) {
        episodes.forEach{ add(episode: $0)}
    }
}

extension Season: CustomStringConvertible{
    var description: String {
        return "\(Constants.PrefixSeason) \(String(numberSeason))"
    }
}

extension Season{
    var proxyForEquality: String {
        return "\(name)"
    }
    
    var proxyForComparison: String {
        return name.uppercased()
    }
}

extension Season: Hashable{
    var hashValue: Int{
        return proxyForEquality.hashValue
    }
}

extension Season: Equatable {
    static func == (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Season: Comparable {
    static func < (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
