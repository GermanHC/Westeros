//
//  Episode.swift
//  Westeros
//
//  Created by German Hernandez on 26/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import Foundation
typealias Recap = String
typealias Title = String

final class Episode{
    
    // MARK: - Properties
    private var _name:String = ""
    var title: Title = ""
    let overallNumber: Int
    let inSeasonNumber: Int
    let recap: Recap
    let originallyAiredDate: Date?
    weak var season: Season?
    
    // MARK: - Initialization
    init( overAllNumber: Int, inSeasonNumber: Int, recap: Recap, originallyAiredDate: Date?, season: Season, title: Title) {
        self._name = Constants.PrefixEpisode + String(inSeasonNumber)
        self.overallNumber = overAllNumber
        self.inSeasonNumber = inSeasonNumber
        self.recap = recap
        self.originallyAiredDate = originallyAiredDate
        self.season = season
        self.title = title
    }
    
    
}

extension Episode: CustomStringConvertible{
    var description: String {
        return "\(String(describing: season)) \(Constants.PrefixEpisode) \(String(inSeasonNumber))"
    }
}

extension Episode{
    var fullName: String {
        return "\(Constants.PrefixEpisode) \(String(inSeasonNumber))"
    }
    
    var proxyForEquality: String {
      return "\(String(describing: season))\(Constants.PrefixEpisode)\(String(inSeasonNumber))".removeWhitespaces()
    }
    
    var proxyForComparison: Int {
        return overallNumber
    }
}

extension Episode: Equatable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Episode: Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool {
      return  lhs.overallNumber < rhs.overallNumber
    }
}
