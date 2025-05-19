import Cocoa

func nextBig (num: Int) -> Int?  {
    var numeros: [Int] = []
    var numToString = String(num)
    for i in numToString {
        var x = Int(String(i)) ?? 0
        numeros.append(x)
    }
    
    for _ in 1...numeros.count {
        for i in 1...numeros.count - 1  {
            if numeros[i-1] < numeros [i]   {
                var temp = numeros[i-1]
                numeros[i-1] = numeros [i]
                numeros [i] = temp
                
            }
        }
    }
    let valorRetorno = Int(numeros.map {String($0)}.joined())
    if valorRetorno == num || num <= 10 {
        return nil
    }
    return valorRetorno
}

if let valorRetorno = nextBig(num: 12345690) {
    print("El valor del numero es: \(valorRetorno) ")
    
} else {
    print("No se pudo retornar ningun valor")
}
print("/////////////////////////////////////////////")
if let valorRetorno = nextBig(num: 111111111) {
    print("El valor del numero es: \(valorRetorno) ")
    
} else {
    print("No se pudo retornar ningun valor")
}
