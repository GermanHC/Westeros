//
//  String+Date.swift
//  Westeros
//
//  Created by German Hernandez on 27/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import Foundation

extension String {
    func getDateFromString() -> Date? {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.date(from: self)
    }
}

extension Date {
    func getStringFromDate() -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: self)
        
    }
}

extension Date {
    func getStringYearFromDate() -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: self)
        
    }
}
