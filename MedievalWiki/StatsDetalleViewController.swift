import Foundation
import UIKit
import Alamofire
import AlamofireImage

class StatsDetalleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvStats: UITableView!
    var stats : Stats?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = stats?.personaje
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaStatsDetalles") as? CeldaStatsDetalleController
        celda?.lblPersonaje.text = stats!.personaje
        celda?.lblVida.text = stats!.vida
        celda?.lblMagia.text = stats!.magia
        celda?.lblFuerza.text = stats?.fuerza
        celda?.lblVelocidad.text = stats?.velocidad
        celda?.lblResistencia.text = stats?.resistencia
        celda?.lblInteligencia.text = stats!.inteligencia
        celda?.lblSuerte.text = stats!.suerte
        
        Alamofire.request("https://medievalwiki2.azurewebsites.net/" + stats!.urlLesion).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgLesion.image =  data
            case .failure(_) :
                print("La foto lesión no cargó")
            }
        }
        
        Alamofire.request("https://medievalwiki2.azurewebsites.net/" + stats!.urlArmamentos).responseImage{
                   response in
                   switch(response.result) {
                   case .success(let data) :
                       celda?.imgArmamentos.image =  data
                   case .failure(_) :
                       print("La foto armamentos no cargó")
                   }
               }
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 540
    }
}
