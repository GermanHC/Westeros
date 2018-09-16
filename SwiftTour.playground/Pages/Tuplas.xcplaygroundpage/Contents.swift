//: [Previous](@previous)

import Foundation

// Crear nuevos tipos a partir de los ya existentes

/*:
 #Nuevos tipos:
 - Tuplas
 - Structs
 - Classes
 - Enums
 */

// TUPLAS
var httpResponse = ("OK", 200)
// Las tupla tienen tipo.  En este caso es (String, Int)

dump(type(of: httpResponse))

//httpResponse = (200, "OK") ERROR!!!
httpResponse = ("BAD REQUEST", 400)

// Acceso a los componentes de una tupla: por posicion
httpResponse.0
httpResponse.1
//httpResponse.2 error

// Funciones que devuelven más de un valor
func intDiv(_ a: Int, _ b: Int) -> (Int, Int) {
    return ((a / b), (a % b))
}

intDiv(3, 2)

typealias HTTPStatus = (code: Int, text: String)
typealias HTTPRequest = String
typealias HTTPResponse = (body: String, status: HTTPStatus)

func httpServer(request: HTTPRequest) -> HTTPResponse {
    // Aqui seria el codigo de verdad
    // ...
    return ("It worked!", (200, "OK"))
}

let response = httpServer(request: "index.html")
dump(response)

// PATTERN MACHING
/* Manera antigua sin pattern maching
 let result = intDiv(5, 2)
let cociente = result.0
let resto = result.1
 */
// Nueva forma con pattern maching
let (cociente, resto) = intDiv(5, 2)

dump(cociente)
dump(resto)
/* Manera antigua sin pattern maching
let result = httpServer(request: "index.html")
let status = result.1 o se puede acceder por nombre let status = result.code
 */
// Nueva forma con pattern maching
let (_, status) = httpServer(request: "index.html")
dump(status)

let (code, _) = httpServer(request: "index.html")
dump(code)

// Tuplas de N elementos
// a la tupla de N elementos se le llama n-tupla
(2, 4, "abc") // 3-tupla
(3,4) // 2-tupla
(3) // 1-tupla??? NO!!! Es el elemento
() // 0-tupla????? SI! Significa la NADA. Como Void

// En swift habrá por alguna parte un typealias Void = ()

// Las 3 siguientes funciones son equivalentes
func f(a: Int) {
    print(a)
}

func h(a: Int) -> () {
    print(a)
}

func g(a: Int) -> Void {
    print(a)
}

f(a: 7)
h(a: 7)
g(a: 7)
//: [Next](@next)
