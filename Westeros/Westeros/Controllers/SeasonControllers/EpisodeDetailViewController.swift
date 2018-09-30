//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by German Hernandez on 29/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originallyAiredDateLabel: UILabel!
    @IBOutlet weak var recapLabel: UILabel!
    
    // MARK: - Properties
    var model: Episode
    
    // MARK: - Initialization
    init(model:Episode) {
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
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sincronizar modelo y vista
        syncModelWithView()
    }
    
    // MARK: - Notifications
    @objc func seasonDidChange(notification: Notification) {
        // Sacar la info y Extraer la temporada
        guard let info = notification.userInfo,
            let season: Season = info[Constants.SeasonKey] as? Season else { return }
        
        let episodeListViewController = EpisodeListViewController(model: season.sortedEpisodes)
        
        // Push
        navigationController?.pushViewController(episodeListViewController, animated: true)
    }
    
  
    
    // MARK: - Sync
    func syncModelWithView() {
        titleLabel.text = model.fullName
        originallyAiredDateLabel.text = model.originallyAiredDate?.getStringFromDate() ?? ""
        recapLabel.text = model.recap
    }

}
