//
//  main.swift
//  Tarea20mayo
//
//  Created by bootcamp on 2025-05-20.
//

import Foundation
var vectorDeDados: [Int] = []
for _ in 1...5 {
    vectorDeDados.append(Int.random(in:1...6))
    
}


func casoDeJuego(vectorDados:Array<Int>) {
    var casos: [Int: Int] = [:]
    
    
    
    for numero in vectorDados {
        casos[numero,default: 0] += 1
        }
    
    let repeticiones = casos.values.sorted(by:>)
    switch  repeticiones{
        
    case [5]:
        print("Generala!!")
        return
    case [4,1]:
        print("Poker!!")
        return
    case [3,2]:
        print("FULL!!")
        return
    default:
        let casoEscalera = vectorDados.sorted()
        let vectorEscaleras = [[1,2,3,4,5],[2,3,4,5,6],[1,4,5,6,7,8]]
        for i in 0...2 {
            if casoEscalera == vectorEscaleras[i]{
                print("Escalera!!")
                return
            }
        }
        print("NADA!!")
    }
}


casoDeJuego(vectorDados:vectorDeDados)
print(vectorDeDados)
