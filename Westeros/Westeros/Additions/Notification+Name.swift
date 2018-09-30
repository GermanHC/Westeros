//
//  Notification+Name.swift
//  Westeros
//
//  Created by German Hernandez on 25/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let houseDidChangeNotification = Notification.Name(Constants.HouseDidChangeNotificationName)
    static let seasonDidChangeNotification = Notification.Name(Constants.SeasonDidChangeNotificationName)
    static let episodeDidChangeNotification = Notification.Name(Constants.EpisodeDidChangeNotificationName)
    static let memberDidChangeNotification = Notification.Name(Constants.MemberDidChangeNotificationName)
}
