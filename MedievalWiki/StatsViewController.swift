import Foundation
import AlamofireImage
import Alamofire
import UIKit

class StatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvStats: UITableView!
    var stats : [Stats] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Estadísticas"
        Alamofire.request("https://medievalwiki2.azurewebsites.net/wp-json/acf/v3/estadisticas/?per_page=12").responseJSON {
            response in switch(response.result){
            case .success(let datos) :
                if let arregloStats = datos as? NSArray{
                    for stats in arregloStats {
                        if let diccionarioStats = stats as? NSDictionary{
                            let nuevosStats = Stats(diccionario: diccionarioStats)
                            self.stats.append(nuevosStats)
                        }
                    }
                    self.tvStats.reloadData()
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
        return stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaStats") as? CeldaStatsController
        celda?.lblPersonaje.text = stats[indexPath.row].personaje
        
        Alamofire.request("https://medievalwiki2.azurewebsites.net/" + stats[indexPath.row].urlLesion).responseImage{
            response in
            switch(response.result) {
            case .success(let data) :
                celda?.imgPersonaje.image =  data
            case .failure(_) :
                print("La foto lesión no cargó")
            }
        }
        
        Alamofire.request("https://medievalwiki2.azurewebsites.net/" + stats[indexPath.row].urlArmamentos).responseImage{
                   response in
                   switch(response.result) {
                   case .success(let data) :
                       celda?.imgLesion.image =  data
                   case .failure(_) :
                       print("La foto armamentos no cargó")
                   }
               }
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToStatsDetalles"{
            let destino = segue.destination as? StatsDetalleViewController
                destino?.stats = stats[tvStats.indexPathForSelectedRow!.row]
        }
    }
   
}
