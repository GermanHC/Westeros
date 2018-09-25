//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

print(str) //filter

func imprimirPorConsola(_ mensaje: String){
    print(mensaje)
}

imprimirPorConsola(str)



protocol MyProtocol {
    // Lo que sea
}

class MyClass: MyProtocol {
    // Cosas aqui
}

let object: String = "sdafdsferferfwcvwvw"

extension String: MyProtocol {}

let prot: MyProtocol = "sdfaadqwdqwd"

class Constants {
    static let houseDidChangeNotificationName = "HouseDidChange"
    static let houseKey = "HouseKey"
    static let lastHouseKey = "LastHouseKey"
}

let a = Constants.houseDidChangeNotificationName
let b = Constants.lastHouseKey
//: [Next](@next)
