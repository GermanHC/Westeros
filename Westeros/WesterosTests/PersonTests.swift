//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by German Hernandez on 16/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {

    var starkHouse: House!
    var starkSigil: Sigil!
    var ned: Person!
    var arya: Person!
    
    override func setUp() {
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        let starkUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: starkUrl)
        ned = Person(name: "Eddard", alias: "Ned", house:starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPersonExistence() {
        XCTAssertNotNil(ned)
        
        XCTAssertNotNil(arya)
    }

    func testPersonFullName() {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
        XCTAssertEqual(arya.fullName, "Arya Stark")
    }
    
    func testPersonEquality() {
        // 1. Identidad
        XCTAssertEqual(ned, ned)
        
        // 2. Igualdad
        let eddard = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertEqual(eddard, ned)
        
        // 3. Desigualdad
        XCTAssertNotEqual(ned, arya)
    }
    
    func testPersonComparison() {
        XCTAssertGreaterThan(ned, arya)
    }
}
