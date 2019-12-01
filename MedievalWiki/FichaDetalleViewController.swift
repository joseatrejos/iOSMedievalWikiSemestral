import Foundation
import UIKit
import Alamofire
import AlamofireImage

class FichaDetalleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvFichas: UITableView!
    var ficha : Ficha?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ficha?.nombre
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaFichaDetalle") as? CeldaFichaDetalleController
        celda?.lblNombre.text = ficha!.nombre
        celda?.lblApellido.text = ficha!.apellido
        celda?.lblReino.text = ficha!.reino
        celda?.lblSexo.text = ficha!.sexo
        celda?.lblEdad.text = ficha!.edad
        celda?.lblRaza.text = ficha!.raza
        celda?.lblEstado.text = ficha!.estado
        celda?.lblMagia.text = ficha!.magia
        
        Alamofire.request("https://medievalwiki2.azurewebsites.net/" + ficha!.urlImagen).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgPersonaje.image =  data
            case .failure(_) :
                print("La foto del personaje no cargó")
            }
        }
        
        Alamofire.request("https://medievalwiki2.azurewebsites.net/" + ficha!.urlArmamento).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgArmamento.image = data
            case .failure(_) :
                print("La foto de armamentos no cargó")
            }
        }
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
}
