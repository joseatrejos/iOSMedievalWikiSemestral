import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pantallaPrincipal : [PantallaPrincipal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MedievalWiki"
        pantallaPrincipal.append(PantallaPrincipal(seleccion: "Fichas de Personajes"))
        pantallaPrincipal.append(PantallaPrincipal(seleccion: "Estadísticas"))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pantallaPrincipal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaSeleccionMenus") as? CeldaMenuPersonajesController
        celda?.lblMenu.text = pantallaPrincipal[indexPath.row].seleccion
        return celda!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let seleccion = pantallaPrincipal[indexPath.row].seleccion
        let viewController = storyboard?.instantiateViewController(withIdentifier: seleccion)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
