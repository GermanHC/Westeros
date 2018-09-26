//
//  String+RemoveWhiteSpaces.swift
//  Westeros
//
//  Created by German Hernandez on 27/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import Foundation

extension String {
    func removeWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
