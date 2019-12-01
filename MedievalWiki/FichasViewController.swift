import Foundation
import UIKit
import Alamofire
import AlamofireImage

class FichasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvFichas: UITableView!
    var ficha : [Ficha] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fichas de Personajes"
        Alamofire.request("https://medievalwiki2.azurewebsites.net/wp-json/acf/v3/ficha_de_personajes/?per_page=12").responseJSON {
            response in switch(response.result){
            case .success(let datos) :
                if let arregloPersonajes = datos as? NSArray{
                    for personajes in arregloPersonajes {
                        if let diccionarioFichas = personajes as? NSDictionary{
                            let nuevaFicha = Ficha(diccionario: diccionarioFichas)
                            self.ficha.append(nuevaFicha)
                        }
                    }
                    self.tvFichas.reloadData()
                }
            case .failure(_) :
                print("Error de AlamoFire")
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ficha.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaFichas") as? CeldaFichasController
        celda?.lblNombre.text = ficha[indexPath.row].nombre
        celda?.lblReino.text = ficha[indexPath.row].reino
        
        Alamofire.request("https://medievalwiki2.azurewebsites.net/" + ficha[indexPath.row].urlImagen).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgPersonaje.image =  data
            case .failure(_) :
                print("La foto del personaje no cargó")
            }
        }
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFichaDetalle"{
            let destino = segue.destination as? FichaDetalleViewController
                destino?.ficha = ficha[tvFichas.indexPathForSelectedRow!.row]
        }
    }
}
