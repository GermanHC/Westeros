//
//  Character.swift
//  Westeros
//
//  Created by German Hernandez on 16/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import Foundation

final class Person {

    // MARK: - Properties
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String {
        get{
            return _alias ?? "" // Devuelveme _alias, si hay algo, y si no, ""
        }
    }
    // MARK: - Initialization
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        _alias = alias
        self.house = house
        self.house.add(person: self)
    }
}

extension Person {
    var fullName: String {
        return "\(name) \(house.name)"
    }
}

extension Person{
    var proxyForEquality: String {
        return "\(name)\(alias)\(house.name)"
    }
    
    var proxyForComparison: String {
        return fullName.uppercased()
    }
}

extension Person: Hashable {
    var hashValue: Int{
        return proxyForEquality.hashValue
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Person: Comparable{
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
