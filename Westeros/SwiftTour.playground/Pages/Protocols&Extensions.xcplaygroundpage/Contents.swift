//: [Previous](@previous)

import Foundation

/*
 EXTENSIONES: Como las categorias de Objetive C
 Son un mecanismo para:
 1) Añadir funcionalidades a una clase/struct ya existente
 2) Modularizar clases o structs
 
 */

extension Int {
    func invert() -> Int {
        return -self
    }
}

// A partir de aqui, todos los Ints tienen este metodo.
8.invert()

// Que cosas NO se pueden añadir a una extension???
/*
 - Nada que pueda cambiar el layout de memoria del objeto(Añadir propiedades).
 - Ciertos tipos de inits (panico a nil).
 */

// Esto no lo podemos hacer
//extension Int{
// let a: Double
//}


struct Complex {
    let x: Double
    let y: Double
}

extension Complex {
    //Propiedad COMPUTADA: se evaluan sobre la marcha. Tienen un getter y un setter.
    
    var magnitude: Double {
        get {
            return ((x*x) + (y*y)).squareRoot()
        }
    }
}

/*
 PROTOCOLS: Similares a los interfaces de Java o los protocols de ObjC
 
 Obligatorio:
 - CustomStringConvertible
 - Equatable
 - Hashable
 - Comparable
 */

extension Complex: CustomStringConvertible {
    var description: String {
        return "\(x) + \(y)j" // interpolación de cadenas
    }
}
let c = Complex(x: 23, y: -8) // 23 - 8j

let d = Complex(x: 4, y: 7)

print(c)

extension Complex: Equatable {
    static func == (lhs: Complex, rhs: Complex) -> Bool {
        return (lhs.x, lhs.y) ==  (rhs.x, rhs.y)
    }
}

d==d
c==d

// Podemos crear nuestros propios protocols
protocol Answerable {
    var answer: Int{get}
}

extension Answerable {
    var answer: Int{
        return 8
    }
}

extension String: Answerable{}

"What is the meaning of Life, the Universe and everything?".answer

extension Complex: Answerable {
    var answer: Int{
        return 42
    }
}

c.answer

//: [Next](@next)
