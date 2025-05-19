import Foundation


func arraydom (min:Int, max:Int, MinNums:Int , MaxNums:Int) -> Array<Int> {
    
    var numeros:[Int] = []
    
    for _ in MinNums...MaxNums {
        numeros.append(Int.random(in: min...max))
    }
    return numeros
}

func item1() {
    
    let vectorDeNumeros:[Int] = arraydom(min: -5, max: 5, MinNums: 0, MaxNums: 9)
    
    if let maximo = vectorDeNumeros.max() {
        print("Máximo: \(maximo)\n")
    } else {
        print("Vector vacío\n")
    }
    print(vectorDeNumeros)
}
item1()

func item2() {
    let vector:[Int] = arraydom(min: -30, max: 30, MinNums: 0, MaxNums: 99)
    var vector2:[Int] = []
    for i in -30...30 {
        vector2.append(i)
    }
    let newSet = Set(vector2).subtracting(vector)
    print("Estos son los numeros que no aparecen: ")
    print(newSet)
    
    var frecuencia: [Int: Int] = [:]
    
    for numero in vector {
        frecuencia [numero, default: 0] += 1
        
    }
    if let (numeroMasRepetido, repeticiones) = frecuencia.max(by: { $0.value < $1.value }) {
        print("Número con más repeticiones: \(numeroMasRepetido) (\(repeticiones) veces)")
    } else {
        print("El vector está vacío, no hay repeticiones.")
    }
}
item2()


func item3() {
    print("Ingresa una palabra o frase para saber si o no palindromo\n")
    if let cadena = readLine() {
        let palabraSinEspacios = cadena.replacingOccurrences(of:" ", with: "")
        let palabraReversed = String(palabraSinEspacios.reversed())
        
        if palabraSinEspacios == palabraReversed {
            print("Es un palindromo")
        }
        else {
            print("No es un palindromo")
        }
    }
    else
    {
        print("Entrada no valida")
    }
    
}
item3()

func item4() {
    var numeros: [Int] = []
    print("Ingrese un numero: ")
    if let userInput = readLine(), let _ = Int(userInput){
        
        for i in userInput{
            if let numero = Int(String(i)){
                numeros.append(numero)
            }
        }
        print(numeros)
    }
    else
    {
        print("ERROR: Entrada no valida")
    }
}
item4()









