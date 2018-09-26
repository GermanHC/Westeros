//
//  HouseListViewController.swift
//  Westeros
//
//  Created by German Hernandez on 23/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

protocol HouseListViewControllerDelegate {
    // Should
    // Will
    // Did
    // Convencion: El primer parametro de las funciones del delegate es SIEMPRE el objeto
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House)
}

class HouseListViewController: UITableViewController {

    // MARK: - Properties
    let model: [House]
    var delegate: HouseListViewControllerDelegate?
    
    // MARK: - Initialization
    init(model: [House]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
    }
    
    func registerCustomCell(){
        // Siempre que utilicemos celdas personalizadas siempre tenemos que registrarlas
        let nib = UINib(nibName: "HouseCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HouseCell")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseCell"
        
        // Descubir el item (casa) que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda (o que nos la den del caché)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! HouseCell
        
        // Sincronizar celda (view) y casa (model)
        cell.sigilImageView.image = house.sigil.image
        cell.nameLabel.text = house.name
        cell.wordsLabel.text = house.words
        
        // Devolver la celda
        return cell
        
    }
    
    // MARK: - Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar la casa en cuestion
        let theHouse = house(at: indexPath.row)
        
        // Crear el controlador del detalle de esa casa
        // let houseDetailViewController = HouseDetailViewController(model: house)
        
        // Push
        //navigationController?.pushViewController(houseDetailViewController, animated: true)
        
        // SIEMPRE emitir la informacion a traves de los dos metodos: delegates y notifications
        // Avisar/Informar al delegado
        delegate?.houseListViewController(self, didSelectHouse: theHouse)
        
        // Enviar una notificacion
        let nc = NotificationCenter.default
        let notification = Notification(name: .houseDidChangeNotification,
                                        object: self,
                                        userInfo: [Constants.HouseKey: house])
        nc.post(notification)
        
        // Guardamos la ultima casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }
}

// MARK: - Persistence (UserDefaults) Solo sirve para persistir PEQUEÑAS cantidades de objetos
// Los objetos tiene que ser sencillos: String, Int, Array, ...
extension HouseListViewController {
    func saveLastSelectedHouse(at row: Int) {
        // Aqui vamos a guardar la ultima casa seleccionada
        let userDefaults = UserDefaults.standard
        
        // Lo insertamos en el diccionario de User Defaults
        userDefaults.set(row, forKey: Constants.LastHouseKey)
        
        // Guardar
        userDefaults.synchronize() // Por si acaso
    }
    
    func lastSelectedHouse() -> House{
        // Averiguar cual es la ultima row seleccionada (si la hay)
        let row = UserDefaults.standard.integer(forKey: Constants.LastHouseKey) // Value 0 es el default
        return house(at: row)
    }
    
    func house(at index: Int) -> House {
        return model[index]
    }
}
