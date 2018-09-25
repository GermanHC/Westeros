import Foundation

/*:
 Las funciones son ciudadanos de primera clase:
 - Podemos meterlas dentro de un array
 - Podemos asignarlas a variables
 - Pueden ser parametros de otras funciones
 - Ser el resultado que devuelve una funcion (es deir, una funcion puede devolver otra funcion)
 */

// Tipo de una funcion
typealias IntToInt = (Int) -> Int // Clousure

 // - Ser el resultado que devuelve una funcion (es deir, una funcion puede devolver otra funcion)
func adder(n: Int) -> IntToInt {
    
    // Las funciones capturan el entorno lexico
    func f(x: Int) -> Int {
        return x + n
    }
    return f
}
 
// - Podemos asignarlas a variables
let add42 = adder(n: 42)
let add10 = adder(n: 10)

add42(8)
add10(8)

// - Pueden ser parametros de otras funciones
func apply(f: IntToInt, n: Int) -> Int {
    return f(n)
}

apply(f: add42, n: 8)
apply(f: add10, n: 18)

// SINTAXIS DE LOS CLOUSURES
// Toda funcion de Swift es, en realidad, un clousure
func f(_ n: Int) -> Int {
    return n + 8
}

let f1 = { (n: Int) -> Int in
    return n + 8
}

f(8)
f1(8)

func h(n: Int, t: Int) -> Int {
    return 9
}

// - Podemos meterlas dentro de un array
// let functions [IntToInt] = [f, f1, add42, add10]
// Por inferencia de tipos omitimos [IntToInt]
let functions = [f, f1, add42, add10]


//functions.append(h) //ERROR no es del tipo de las funciones que ya tiene

for f in functions {
    print(f(8))
}

// Sintaxis abreviada de clousures

let clousures = [
    f,
    { (n: Int) -> Int in return n + 8 }, // 100% explicito
    { (n: Int) in return x + 19 }, // 95% explicito. No hace falta especificar el tipo de salida. Lo infiere de la primera "f"
    { n in return n * 5}, // 90% explicito. No hace falta especificar el tipo de entrada. Lo infiere de la primera "f"
    { n in n * 5 }, // Si el cuerpo de la funcion, solo tiene una linea, no hace falta el return
    { $0 * 3 } // No hace falta, ni siquiera, ponerle un nombre al parametro
]

// Trailing clousure = "Clausura que cuelga"
// Bloque/Clousure de funalizacion "completionHandler", etc....
let evens = [6, 12, 8, 2, 10, 4]

evens.sorted(by: {(a:Int , b: Int) -> Bool in
    a > b
})

//// Trailing clousure
//evens.sorted{(a: Int, b:Int) -> Bool in
//    return a > b
//}
//// Simplificado 1
//evens.sorted{(a, b) -> Bool in
//    return a > b
//
//// Simplificado 2
//evens.sorted{(a, b) in
//    return a > b
//}
//
//// Simplificado 3
//evens.sorted{ a, b in
//        return a > b
//}
//
//// Simplificado 4
//evens.sorted{
//        return $0 > $1
//}
//
//// Simplificado 5
//evens.sorted{
//    $0 > $1
//    }
//
//// Simplificado 6
//evens.sorted{ $0 > $1 }
//
var result = evens.sorted {$0 > $1}

// Clasicos de FP: map, flatMap (compactMap), filter, reduce, ...

// Programacion imperativa (la de siempre)
var results = [Int]()
for number in evens {
//    let r = number * 2
//    results.append(r)
    results.append(number * 2)
}

var results2 = [String]()
for number in results {
    results2.append("El numero es \(number)")
}


print(results)
// FP - map
results = []

//results = evens.map(number in number * 2)
//results = evens.map { $0 * 2 }
results2 = evens
    .map { $0 * 2 }
    .map{ "El numero es \($0)" }

// FILTER
results = evens.filter { $0 > 6 }

// FLATMAP
let intsOrNil: [Int?] = [1, 2, nil, 4, nil, 7, nil, 10, 12, nil]

//results = intsOrNil.map{ each in
//    if let each = each {
//        return each * 5
//    }}

//results = intsOrNil.compactMap{ $0?.hashValue }

let limpioDeNiles = intsOrNil.compactMap{$0}
print(limpioDeNiles)

// REDUCE
//
//evens.reduce(0) {result, each in
//    var total = result
//    total = total + each
//    return total
//}
// Equivalenta al anterior
let r = evens.reduce(0) { $0 + $1 }
