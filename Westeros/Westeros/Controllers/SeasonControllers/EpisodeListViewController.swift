//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by German Hernandez on 29/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
  
    // MARK: - Properties
    var model: [Episode]
    
    init(model: [Episode]) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        title = Constants.titleEpisodes
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange),
                                       name: .seasonDidChangeNotification,
                                       object: nil) // Object es el que manda la notificación
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Notifications
    @objc func seasonDidChange(notification: Notification) {
        // Sacar la info y Extraer la temporada
        guard let info = notification.userInfo,
            let season: Season = info[Constants.SeasonKey] as? Season else { return }
        
        // Actualizar el modelo
        self.model = season.sortedEpisodes
        
        // Sincronizar model - vista
        syncModelWithView()
        tableView.reloadData()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = Constants.EpisodeCellId
        
        // Primero descubrimos cual es el episodio que hay que mostrar
        let theEpisode = episode(at: indexPath.row)
        
        
        // Crear una celda (o que nos la den del caché)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        // Sincronizar modelo-vista (person-cell)
        cell?.textLabel?.text = theEpisode.fullName
        cell?.detailTextLabel?.text = theEpisode.title
        
        return cell!
    }
    
    func episode(at index: Int) -> Episode {
        return model[index]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeDetailViewController = EpisodeDetailViewController(model: episode(at: indexPath.row))
        // Push
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
    }
}
