import Foundation

class Stats{
    var personaje : String
    var vida : String
    var magia : String
    var fuerza : String
    var velocidad : String
    var resistencia : String
    var inteligencia : String
    var suerte : String
    var urlLesion : String
    var urlArmamentos : String
        
    init(personaje : String,vida : String, magia : String, fuerza : String, velocidad : String, resistencia : String, inteligencia : String, suerte : String, urlLesion : String, urlArmamentos : String) {
        self.personaje = personaje
        self.vida = vida
        self.magia = magia
        self.fuerza = fuerza
        self.velocidad = velocidad
        self.resistencia = resistencia
        self.inteligencia = inteligencia
        self.suerte = suerte
        self.urlLesion = urlLesion
        self.urlArmamentos = urlArmamentos
    }
        
    init(diccionario : NSDictionary){
        self.personaje = ""
        self.vida = ""
        self.magia = ""
        self.fuerza = ""
        self.velocidad = ""
        self.resistencia = ""
        self.inteligencia = ""
        self.suerte =  ""
        self.urlLesion = ""
        self.urlArmamentos = ""
        
        if let acf = diccionario.value(forKey: "acf") as? NSDictionary{
            if let personaje = acf.value(forKey: "personaje") as? String{
                self.personaje = personaje
            }
            
            if let vida = acf.value(forKey: "vida") as? String{
                self.vida = vida
            }
            
            if let magia = acf.value(forKey: "magia") as? String{
                self.magia = magia
            }
            
            if let fuerza = acf.value(forKey: "fuerza") as? String{
                self.fuerza = fuerza
            }
            
            if let velocidad = acf.value(forKey: "velocidad") as? String{
                self.velocidad = velocidad
            }
            
            if let resistencia = acf.value(forKey: "resistencia") as? String{
                self.resistencia = resistencia
            }
            
            if let inteligencia = acf.value(forKey: "inteligencia") as? String{
                self.inteligencia = inteligencia
            }
            
            if let suerte = acf.value(forKey: "suerte") as? String{
                self.suerte = suerte
            }
            
            if let urlLesion = acf.value(forKey: "lesion") as?String{
                self.urlLesion = urlLesion
            }
            
            if let urlArmamentos = acf.value(forKey: "armamentos") as? String{
                self.urlArmamentos = urlArmamentos
            }
        }
    }
}
