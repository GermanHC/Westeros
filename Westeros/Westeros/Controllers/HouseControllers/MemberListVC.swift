//
//  MemberListVC.swift
//  Westeros
//
//  Created by German Hernandez on 30/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

class MemberListVC: UITableViewController {
    
    // MARK: - Properties
    var model: [Person]
    
    init(model: [Person]) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        title = Constants.titleMembers
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange),
                                       name: .houseDidChangeNotification,
                                       object: nil) // Object es el que manda la notificación
    }
     
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification) {
        // Sacar la info y Extraer la casa
        guard let info = notification.userInfo,
            let house: House = info[Constants.HouseKey] as? House else { return }
        
        // Actualizar el modelo
        self.model = house.sortedMembers
        
        // Sincronizar model - vista
        syncModelWithView()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = Constants.MemberCellId
        
        // Primero descubrimos cual es la person que hay que mostrar
        let thePerson = person(at: indexPath.row)
        
        
        // Crear una celda (o que nos la den del caché)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        // Sincronizar modelo-vista (person-cell)
        cell?.textLabel?.text = thePerson.name
        cell?.detailTextLabel?.text = thePerson.alias
        
        return cell!
    }
    
    func person(at index: Int) -> Person {
        return model[index]
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memberDetailViewController = MemberDetailViewController(model: person(at: indexPath.row))
        // Push
        navigationController?.pushViewController(memberDetailViewController, animated: true)
    }
    
}
