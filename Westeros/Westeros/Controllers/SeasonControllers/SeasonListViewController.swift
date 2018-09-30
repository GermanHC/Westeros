//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by German Hernandez on 28/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit


protocol SeasonListViewControllerDelegate {
     func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season)
}

class SeasonListViewController: UITableViewController {
    
    // MARK: - Properties
    let model: [Season]
    var delegate: SeasonListViewControllerDelegate?
    
    // MARK: - Initialization
    init(model: [Season]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = Constants.titleSeasons
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
    }
    
    func registerCustomCell(){
        // Siempre que utilicemos celdas personalizadas siempre tenemos que registrarlas
        let nib = UINib(nibName: Constants.SeasonCellId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.SeasonCellId)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = Constants.SeasonCellId
        
        // Descubir el item (season) que tenemos que mostrar
        let season = model[indexPath.row]
        
        // Crear una celda (o que nos la den del caché)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! SeasonCell
        
        // Sincronizar celda (view) y casa (model)
        cell.nameLabel.text = season.name
        cell.originallyAiredYearLabel.text = season.originallyAiredYear?.getStringYearFromDate() ?? ""
        
        // Devolver la celda
        return cell
        
    }
    
    
    
    // MARK: - Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar la temporada en cuestion
        let theSeason = season(at: indexPath.row)
        
        // SIEMPRE emitir la informacion a traves de los dos metodos: delegates y notifications
        // Avisar/Informar al delegado
        delegate?.seasonListViewController(self, didSelectSeason: theSeason)
        
        // Enviar una notificacion
        let nc = NotificationCenter.default
        let notification = Notification(name: .seasonDidChangeNotification,
                                        object: self,
                                        userInfo: [Constants.SeasonKey: theSeason])
        nc.post(notification)
        
        // Guardamos la ultima temporada seleccionada
        saveLastSelectedSeason(at: indexPath.row)
    }
}

extension SeasonListViewController {
    func saveLastSelectedSeason(at row: Int) {
        // Aqui vamos a guardar la ultima temporada seleccionada
        let userDefaults = UserDefaults.standard
        
        // Lo insertamos en el diccionario de User Defaults
        userDefaults.set(row, forKey: Constants.LastSeasonKey)
        
        // Guardar
        userDefaults.synchronize() // Por si acaso
    }
    
    func lastSelectedSeason() -> Season{
        // Averiguar cual es la ultima row seleccionada (si la hay)
        let row = UserDefaults.standard.integer(forKey: Constants.LastSeasonKey) // Value 0 es el default
        return season(at: row)
    }
    
    func season(at index: Int) -> Season {
        return model[index]
    }
}
