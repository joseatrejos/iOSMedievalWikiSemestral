import Foundation

class Ficha {
    var nombre : String
    var apellido : String
    var sexo : String
    var edad : String
    var urlImagen : String
    var raza : String
    var reino : String
    var estado : String
    var urlArmamento : String
    var magia : String
    
    init(nombre : String,apellido : String, sexo : String, edad : String, urlImagen : String, raza : String, reino : String, estado : String, urlArmamento : String, magia : String) {
        self.nombre = nombre
        self.apellido = apellido
        self.sexo = sexo
        self.edad = edad
        self.urlImagen = urlImagen
        self.raza = raza
        self.reino = reino
        self.estado = estado
        self.urlArmamento = urlArmamento
        self.magia = magia
    }
    
    init(diccionario : NSDictionary){
        self.nombre = ""
        self.apellido = ""
        self.sexo = ""
        self.edad = ""
        self.urlImagen = ""
        self.raza = ""
        self.reino = ""
        self.estado =  ""
        self.urlArmamento = ""
        self.magia = ""
        
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary{
            if let nombre = acf.value(forKey: "nombre") as? String{
                self.nombre = nombre
            }
            
            if let apellido = acf.value(forKey: "apellido") as? String{
                self.apellido = apellido
            }
            
            if let sexo = acf.value(forKey: "sexo") as? String{
                self.sexo = sexo
            }
            
            if let edad = acf.value(forKey: "edad") as? String{
                self.edad = edad
            }
            
            if let urlImagen = acf.value(forKey: "imagen") as? String{
                self.urlImagen = urlImagen
            }
            
            if let raza = acf.value(forKey: "raza") as? String{
                self.raza = raza
            }
            
            if let reino = acf.value(forKey: "reino") as? String{
                self.reino = reino
            }
            
            if let estado = acf.value(forKey: "estado") as? String{
                self.estado = estado
            }
            
            if let urlArmamento = acf.value(forKey: "armamento") as? String{
                self.urlArmamento = urlArmamento
            }
            
            if let magia = acf.value(forKey: "magia") as? String{
                self.magia = magia
            }
        }
    }
}
