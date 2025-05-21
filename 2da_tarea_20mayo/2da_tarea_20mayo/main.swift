//
//  main.swift
//  2da_tarea_20mayo
//
//  Created by bootcamp on 2025-05-20.
//

import Foundation

enum Palos: String, CaseIterable {
    case corazones = "♥️"
    case diamantes = "♦️"
    case trebol = "♣️"
    case espadas = "♠️"
}

enum Valores: String, CaseIterable {
    case dos = "2"
    case tres = "3"
    case cuatro = "4"
    case cinco = "5"
    case seis = "6"
    case siete = "7"
    case ocho = "8"
    case nueve = "9"
    case T = "10"
    case J = "11"
    case Q = "12"
    case K = "13"
    case ace = "14"
}

struct Carta: CustomStringConvertible {
    let palo: Palos
    let valor: Valores

    var description: String {
        return "\(palo.rawValue)\(valor.rawValue)"
    }
}

class Mazo {
    private var mazo: [Carta] = []

    func reset() {
        mazo = []
        for palo in Palos.allCases {
            for valor in Valores.allCases {
                mazo.append(Carta(palo: palo, valor: valor))
            }
        }
    }

    func barajar() {
        mazo.shuffle()
    }

    func repartir() -> Carta? {
        return mazo.isEmpty ? nil : mazo.removeFirst()
    }

    var cantidadRestante: Int {
        return mazo.count
    }
    func imprimirMazo() {
        print(mazo)
    }
}
func valorNumerico (_ valor: Valores) -> Int? {
    return Int(valor.rawValue) ?? 0
}
func contarValores(_ mano: [Carta]) -> [Int: Int] {
    var cuenta: [Int: Int] = [:]
    for carta in mano {
        if let numero = valorNumerico(carta.valor) {
            cuenta[numero, default: 0] += 1
        }
    }
    return cuenta
}

func esColor(_ mano: [Carta]) -> Bool {
    return Set(mano.map { $0.palo }).count == 1
}

func esEscalera(_ mano: [Carta]) -> Bool {
    let valores = mano.map { valorNumerico($0.valor) ?? 0}.sorted()
    
    if Set(valores) == Set([14, 2, 3, 4, 5]) {
        return true
    }
    
    for i in 0..<valores.count - 1 {
        if valores[i + 1] - valores[i] != 1 {
            return false
        }
    }
    return true
}

func esEscaleraColor(_ mano: [Carta]) -> Bool {
    return esColor(mano) && esEscalera(mano)
}

func esPoker(_ mano: [Carta]) -> Bool {
    return contarValores(mano).values.contains(4)
}

func esFull(_ mano: [Carta]) -> Bool {
    let valores = contarValores(mano).values.sorted()
    return valores == [2, 3]
}

func esTrio(_ mano: [Carta]) -> Bool {
    return contarValores(mano).values.contains(3) && !esFull(mano)
}

func esParDoble(_ mano: [Carta]) -> Bool {
    let pares = contarValores(mano).filter { $0.value == 2 }
    return pares.count == 2
}

func esPar(_ mano: [Carta]) -> Bool {
    let pares = contarValores(mano).filter { $0.value == 2 }
    return pares.count == 1
}
func verificarCaso(mano: [Carta]) -> String {
    if esEscaleraColor(mano) { return "Escalera de Color" }
    if esPoker(mano) { return "Póker" }
    if esFull(mano) { return "Full" }
    if esColor(mano) { return "Color" }
    if esEscalera(mano) { return "Escalera" }
    if esTrio(mano) { return "Trío" }
    if esParDoble(mano) { return "Par Doble" }
    if esPar(mano) { return "Par" }
    return "Carta Alta"
}


let mazo = Mazo()
mazo.reset()
mazo.barajar()

var mano: [Carta] = []
for _ in 0..<5 {
    if let carta = mazo.repartir() {
        mano.append(carta)
    }
}

print("Mano: \(mano)")
print("Jugada: \(verificarCaso(mano: mano))")

