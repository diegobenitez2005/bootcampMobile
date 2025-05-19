//
//  main.swift
//  tarea3
//
//  Created by bootcamp on 2025-05-16.
//

import Foundation

//Algo
//Prueba de crear otra rama y hacer un cambio
class Reloj {
    private var horas:Int
    private var minutos:Int
    private var segundos:Int
    
    init() {
        self.horas = 12
        self.minutos = 00
        self.segundos = 00
        
    }
    
    init(horas: Int, minutos: Int, segundos: Int ) {
        self.horas = max(0, min(horas, 23))
        self.minutos = max(0, min(minutos, 59))
        self.segundos = max(0, min(segundos, 59))
    }
    
    init(segundosDesdeMedianoche: Int) {
        let totalSegundos = segundosDesdeMedianoche % 86400
        
        self.horas = totalSegundos / 3600
        self.minutos = (totalSegundos % 3600) / 60
        self.segundos = totalSegundos % 60
    }
    
    
    func setHoras(hora:Int) {
        self.horas = hora
    }
    func setMinutos(min:Int) {
        self.minutos = min
    }
    func setSegundos (seg:Int) {
        self.segundos = seg
    }
    
    func getHoras() -> Int {
        return self.horas
    }
    func getMinutos() -> Int {
        return self.minutos
    }
    func getSegundos() -> Int {
        return self.segundos
    }
    func tick() {
        self.segundos += 1
        if self.segundos > 59 {
            self.minutos += 1
        }
        if self.minutos > 59 {
            self.horas += 1
        }
        if self.horas >= 24{
            self.horas = 0
        }
    }
    func tickDecrement() {
        self.segundos -= 1
        if self.segundos < 0 {
            self.minutos -= 1
        }
        if self.minutos < 0 {
            self.horas -= 1
        }
    }
    
    func esMediodia() -> Bool {
    return self.horas == 12 && self.minutos == 0 && self.segundos == 0
    }   

    func toString() -> String {
        return String(format: "%02d:%02d:%02d",self.horas,self.minutos,self.segundos)
    }
    func restaReloj(segundoReloj:Reloj) {
        let segundosPrimerReloj = (self.horas * 3600) + (self.minutos * 60) + self.segundos
        let segundosSegundoReloj = (segundoReloj.getHoras() * 60) + (segundoReloj.getMinutos() * 60) + segundoReloj.getSegundos()
        
        let diferenciaRelojes = (segundosPrimerReloj - segundosSegundoReloj) % 86400
        self.horas = diferenciaRelojes / 3600
        self.minutos = (diferenciaRelojes % 3600) / 60
        self.segundos = diferenciaRelojes % 60
    }
    func addReloj(otroReloj: Reloj) {
        let totalSegundosActual = self.horas * 3600 + self.minutos * 60 + self.segundos
           let totalSegundosOtro = otroReloj.getHoras() * 3600 + otroReloj.getMinutos() * 60 + otroReloj.getSegundos()
           let totalSegundos = (totalSegundosActual + totalSegundosOtro) % 84600
           self.horas = totalSegundos / 3600
           self.minutos = (totalSegundos % 3600) / 60
           self.segundos = totalSegundos % 60
       }
}



class RelojDemo {
    static func main () {
        var segundosUsuario: Int? = nil
        
        
        while segundosUsuario == nil {
            print("Ingrese la cantidad de horas en segundos (entre 0 y 86400): ")
            if let input = readLine(), let valor = Int(input), valor >= 0 && valor <= 86400 {
                segundosUsuario = valor
            } else {
                print("Entrada no válida. Intente de nuevo.")
            }
        }
        
        let relojito = Reloj(segundosDesdeMedianoche: segundosUsuario!)
        for _ in 1...10 {
            relojito.tick()
            print(relojito.toString())
        }

        let relojitoParaResta = Reloj(segundosDesdeMedianoche: 6000)
        relojito.restaReloj(segundoReloj: relojitoParaResta)
        print("Luego de restar:")
        print(relojito.toString())
        if relojito.esMediodia() {
            print("Es mediodía.")
        } else {
            print("No es mediodía.")
        }
    }
}

RelojDemo.main()
