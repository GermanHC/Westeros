import UIKit

// FUNCIONES COMO VALORES
// En la programacion funcional, las funciones son "ciudadanos de primera clase"
// Podemos meter a las funciones dentro de arrays, de variables, podemos pasarlo como parametros de otra cuncion, o incluso, una funcion puede devolver otra funcion

// Funciones como valores de retorno de otra funcion
typealias IntToInt = (Int) -> Int

// Las funciones son clousures, y capturan el entorno lexico

//let f: (Int) -> Int
//
//func f(x: Int) -> Int{
//    return x + 5
//}

func adder(n: Int) -> IntToInt {
    
    func f(x: Int) -> Int{
        return x + n
    }

    return f
}

let h = adder(n: 42)
h(1)

// Tambien pueden ser parametros de entrada

func apply(f: IntToInt, n: Int) -> Int{
    return f(n)
}

apply(f: h, n: 8)

// Toda funcion de swift es una clausura y puede acceder a lo que se haya definido previamente

// Sintaxis de clousure
func f(_ n: Int) ->Int {
    return  n + 1
}

// Esta funcion f, es equivalente a este clousure
let f1 = { (n: Int) in return n+1}

f(8)
f1(8)

let functions = [f, f1, h]

for fn in functions {
    print(fn(42))
}
