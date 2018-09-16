import UIKit

// Valores, Bindings, REPL
let answer = 42

//answer = 52 ERROR!!!! Porque answer es una constante

var aVariable = "Soy una variable, y puedo cambiar" // var = mutable

aVariable = "Cambié"

// aVariable = 42 ERROR!!!! Tipado fuerte y estatico en swift

// Podemos definir de forma explicita el tipo de una variable
let name: String = "Jon Snow"

// INFERENCIA DE TIPOS: El compilador es capaz de descubrir, el solito el tipo de una variable
let name2 = "Tyrion"

// Un alias para un tipo
// typealias NOMBRE_NUEVO = NOMBRE_VIEJO

typealias Integer = Int

let a: Integer = 8
dump(a)
print(type(of: a))

typealias Author = String

let grr: Author = "George Raymond Richar Marting"

let _ = "Robb Stark"
let _ = "Stannis"
// Tanto Robb como Stannis se han muerto

// for (_, value) in dictionary --- posible uso permite descartar el indice y solo usar el valor

// Intro a funciones
func add(x: Int, y: Int) -> Int{
    return x + y
}

add(x: 44, y: 2) // parametros externos

// Parametros con nombres internos y nombres externos
func fractionOf(numerator n:Double, denominator d: Double) -> Double{
    return n / d
}

fractionOf(numerator: 3.2, denominator: 42)

func add42(_ a: Int) -> Int {
    return 42 + a
}

add42(5)

//add42("Alexandre") da error de compilador

//fractionOf(numerator: 30, denominator: 0) da infinito error de valor en programacion. No da error de compilación, da error de ejecución.

