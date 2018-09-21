//
//  Repository.swift
//  Westeros
//
//  Created by German Hernandez on 21/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    var houses: [House] {get}
}
final class LocalFactory : HouseFactory{
    var houses: [House]{
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: UIImage(named: "lannister.jpg")!, description: "Leon rampantes")
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido")
        
        // Characters creation
        let robb = Person(name: "Robb", alias: "El JovenLobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        
        // Add characters to houses
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        lannisterHouse.add(person: tyrion)
        
        return [starkHouse,lannisterHouse]
    }
}