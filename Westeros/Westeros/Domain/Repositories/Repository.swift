//
//  Repository.swift
//  Westeros
//
//  Created by German Hernandez on 21/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

protocol Repository {
    
    associatedtype T
    
    typealias Filter = (T) -> Bool
    
    func getAll() -> [T]
    func get( named: String ) -> T?
    func getFiltered(filteredBy filter: Filter) -> [T]
}

final class HouseFactory : Repository{
    func getAll() -> [House] {
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: UIImage(named: "lannister.jpg")!, description: "Leon rampantes")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall.jpg")!, description: "Dragon tricefalo")
        
        let starkUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: starkUrl)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: lannisterUrl)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: targaryenUrl)
        
        // Characters creation
        let robb = Person(name: "Robb", alias: "El JovenLobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        // Add characters to houses
        starkHouse.add(persons: arya, robb)
        lannisterHouse.add(persons: tyrion, cersei, jaime)
        targaryenHouse.add(person: dani)
        
        return [starkHouse,lannisterHouse, targaryenHouse].sorted()
    }
    
    func get(named name: String) -> House? {
        return getAll().first(where: {$0.name.uppercased() == name.uppercased()})
    }
    
    func getFiltered(filteredBy filter: (House) -> Bool) -> [House] {
          return getAll().filter(filter)
    }
}

final class SeasonFactory: Repository{
    typealias T = Season
    
    func getAll() -> [Season] {
        
        let firstSeason = Season(originallyAiredYear: "17/04/2011".getDateFromString(), numberSeason: 1, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_1)")!)
        
        let episode1FirstSeason = Episode(overAllNumber: 1, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 1), originallyAiredDate: "17/04/2011".getDateFromString(), season: firstSeason, title: "Winter Is Coming")
        
        let episode2FirstSeason = Episode(overAllNumber: 2, inSeasonNumber: 2, recap: Utils.getRecap(recapEpisodeNum: 2), originallyAiredDate: "24/04/2011".getDateFromString(), season: firstSeason, title: "The Kingsroad")
        
        let secondSeason = Season(originallyAiredYear: "01/04/2012".getDateFromString(), numberSeason: 2, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_2)")!)
        
        let episode1SecondSeason = Episode(overAllNumber: 11, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 11), originallyAiredDate: "01/04/2011".getDateFromString(), season: secondSeason, title: "The North Remembers")
        
        let episode2SecondSeason = Episode(overAllNumber: 2, inSeasonNumber: 2, recap: Utils.getRecap(recapEpisodeNum: 12), originallyAiredDate: "08/04/2011".getDateFromString(), season: secondSeason, title: "The Night Lands")
        
        let thirdSeason = Season(originallyAiredYear: "31/03/2013".getDateFromString(), numberSeason: 3, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_3)")!)
        
        let episode1ThirdSeason = Episode(overAllNumber: 21, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 21), originallyAiredDate: "31/03/2013".getDateFromString(), season: thirdSeason, title: "Valar Dohaeris")
        
        let episode2ThirdSeason = Episode(overAllNumber: 22, inSeasonNumber: 2, recap: Utils.getRecap(recapEpisodeNum: 22), originallyAiredDate: "07/04/2013".getDateFromString(), season: thirdSeason, title: "Dark Wings, Dark Words")
        
        let fourthSeason = Season(originallyAiredYear: "06/04/2014".getDateFromString(), numberSeason: 4, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_4)")!)
        
        let episode1FourthSeason = Episode(overAllNumber: 31, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 31), originallyAiredDate: "06/04/2014".getDateFromString(), season: fourthSeason, title: "Two Swords")
        
        let episode2FourthSeason = Episode(overAllNumber: 32, inSeasonNumber: 2, recap: Utils.getRecap(recapEpisodeNum: 32), originallyAiredDate: "13/04/2014".getDateFromString(), season: fourthSeason, title: "The Lion and the Rose")
        
        let fifthSeason = Season(originallyAiredYear: "12/04/2015".getDateFromString(), numberSeason: 5, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_5)")!)
        
        let episode1FifthSeason = Episode(overAllNumber: 41, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 41), originallyAiredDate: "12/04/2015".getDateFromString(), season: fifthSeason, title: "The Wars to Come")
        
        let episode2FifthSeason = Episode(overAllNumber: 42, inSeasonNumber: 2, recap: Utils.getRecap(recapEpisodeNum: 42), originallyAiredDate: "19/04/2015".getDateFromString(), season: fifthSeason, title: "The House of Black and White")
        
        let sixthSeason = Season(originallyAiredYear: "24/04/2016".getDateFromString(), numberSeason: 6, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_6)")!)
        
        let episode1SixthSeason = Episode(overAllNumber: 51, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 51), originallyAiredDate: "24/04/2016".getDateFromString(), season: sixthSeason, title: "The Red Woman")
        
        let episode2SixthSeason = Episode(overAllNumber: 52, inSeasonNumber: 2, recap: Utils.getRecap(recapEpisodeNum: 52), originallyAiredDate: "01/05/2016".getDateFromString(), season: sixthSeason, title: "Home")
        
        let seventhSeason = Season(originallyAiredYear: "16/07/2017".getDateFromString(), numberSeason: 7, wikiUrl:URL(string: "https://en.wikipedia.org/wiki/Game_of_Thrones_(season_7)")!)
        
        let episode1SeventhSeason = Episode(overAllNumber: 61, inSeasonNumber: 1, recap: Utils.getRecap(recapEpisodeNum: 61), originallyAiredDate: "16/07/2017".getDateFromString(), season: seventhSeason, title: "Dragonstone")
        
        let episode2SeventhSeason = Episode(overAllNumber: 62, inSeasonNumber: 2, recap: Utils.getRecap(recapEpisodeNum: 62), originallyAiredDate: "23/07/2017".getDateFromString(), season: seventhSeason, title: "Stormborn")
        
        firstSeason.add(episodes: episode1FirstSeason,episode2FirstSeason)
        secondSeason.add(episodes: episode1SecondSeason,episode2SecondSeason)
        thirdSeason.add(episodes: episode1ThirdSeason,episode2ThirdSeason)
        fourthSeason.add(episodes: episode1FourthSeason,episode2FourthSeason)
        fifthSeason.add(episodes: episode1FifthSeason,episode2FifthSeason)
        sixthSeason.add(episodes: episode1SixthSeason,episode2SixthSeason)
        seventhSeason.add(episodes: episode1SeventhSeason,episode2SeventhSeason)
        
        return [firstSeason, secondSeason, thirdSeason, fourthSeason, fifthSeason, sixthSeason, seventhSeason]
    }
    
    func get(named name: String) -> Season? {
        return getAll().first(where: {$0.name.uppercased() == name.uppercased()})
    }
    
    func getFiltered(filteredBy filter: (Season) -> Bool) -> [Season] {
        return getAll().filter(filter)
    }
}
