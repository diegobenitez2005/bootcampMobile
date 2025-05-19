func operaciones(){
    let a:Int = 4
    let b:Int = 10
    
    var suma:Int = a + b
    var resta:Int
    var multiplicacion:Int = a * b
    var division:Int
    var modulo:Int
    
    
    
    
    if (a > b) {
        resta = a-b
        division = a/b
        modulo = a % b
    } else {
        resta = b-a
        division = b/a
        modulo = b % a
    }
    
    print("Los resultads son: \nSuma: \(suma)\nResta: \(resta)\nMultiplicacion: \(multiplicacion)\nDivision: \(division)\nModulo: \(modulo)")
}

func comparar(){
    let x:Int = 20
    let y:Int = 40
    
    if (x > y) {
        print("El mayor es \(x)")
    }
    else if(x == y){
        print("Ambos numeros son iguales")
    }
    else {
        print("El mayor es \(y)")
    }
}


func saludar(){
    let nombre:String = "Diego"
    
    print("Bienvenido \(nombre)")
}

func saludar_personalizado(){
    
    print("Introduzca su nombre: ")
    let userInput = readLine()
    print("Bienvenido \(userInput ?? "usuario")")
    
}

func es_par(){
    print("Introduzca un numero para saber si es par: ")
    if let inputUser = readLine(), let numero = Int(inputUser){
        
        guard numero % 2 == 0 else {
            print("Este numero no es par")
            return
        }
        print("Este numero si es par")
        
    }
    else {
        print("ERROR: Entrada no valida")
    }
}

func calcular_iva() {
    let iva:Float = 10/100
    var precioFinal:Float
    print("##Te ayudare a calcular el precio con el IVA incluido##\n")
    print("Introduza el precio sin IVA del producto: ")
    if let userInput = readLine() , let precio = Float(userInput) {
        precioFinal = precio + (precio * iva)
        print("El precio con el IVA incluido es igual a \(precioFinal)")
    }
}

func mostar_numeros() {
    
    for i in 1...100 {
        if (i % 2 == 0) {
            print ("El numero \(i) es divisible entre 2 ")
        }
        else if (i % 3 == 0) {
            print ("El numero \(i) es divisible entre 3 ")
        }
    }
}

func es_positivo() {
    var numero = 0
    var bandera:Bool = false
    repeat {
        
        print("Introduzca un numero para saber si es positivo: ")
        
        if let inputUser = readLine() , let numeroUser = Int(inputUser) {
            if (numeroUser > 0){
                bandera = true
                numero = numeroUser
            } else {
                print("Intenta con uno positivo")
                 }
            
        }
        
    } while (bandera == false)
    print("El numero \(numero) es positivo")
}

func adivinar_palabra() {
    
    let contraseña:String = "holaquetal"
    var intentos:Int = 0
    
    
    while (intentos < 3) {
        print("Adivina la contraseña")
        let inputUser = readLine()
        if inputUser == contraseña{
            print("Correcto!!")
            break
        }
        intentos += 1
    }
    if (intentos >= 3){
        print("Fallaste!!")
    }
}

func es_laboral() {
    print("Introduce un numero del 1 al 7 y te dire si es dia laboral o no\n")
    if let input = readLine(), let numero = Int(input) {
        switch numero {
        case 1:
            print("Domingo no es dia laboral")
            break
        case 2:
            print("Lunes es un dia laboral")
            break
        case 3:
            print("Martes es un dia laboral")
            break
        case 4:
            print("Miercoles es un dia laboral")
            break
        case 5:
            print("Jueves es un dia laboral")
        case 6:
            print("Viernes es un dia laboral")
            break
        case 7:
            print("Sabado no es un dia laboral")
            break
        default:
            print("El numero ingresado se escapa del rango")
            
        }
    }
    else
    {
        print("Entrada no valida")
    }
}


comparar()
print("\n")
operaciones()
print("\n")
saludar()
print("\n")
saludar_personalizado()
print("\n")
es_par()
print("\n")
calcular_iva()
print("\n")
mostar_numeros()
print("\n")
es_positivo()
print("\n")
adivinar_palabra()
print("\n")
es_laboral()
