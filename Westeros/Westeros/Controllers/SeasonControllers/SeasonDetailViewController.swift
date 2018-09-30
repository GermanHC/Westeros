//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by German Hernandez on 28/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    // MARK: - Properties
    var model: Season
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originallyAiredYearLabel: UILabel!
    
    // MARK: - Initialization
    init(model: Season){
       self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        title = model.name
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        // Sincronizar modelo y vista
        syncModelWithView()
        
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        nameLabel.text = "\(model.name)"
        originallyAiredYearLabel.text = model.originallyAiredYear?.getStringYearFromDate() ?? ""
        title = model.name
    }
    
    func setupUI() {
        // Crear los botones
        let wikiButton = UIBarButtonItem(title: Constants.titleWiki, style: .plain, target: self, action: #selector(displayWiki))
        
        let membersButton = UIBarButtonItem(title: Constants.titleEpisodes, style: .plain, target: self, action: #selector(displayEpisodes))
        
        // Añadir el boton
        navigationItem.rightBarButtonItems = [membersButton, wikiButton]
        
        
    }
    
    @objc func displayWiki(){
        //Crear el VC destion
        let wikiSeasonViewController = WikiSeasonViewController(model: model)
        // Navegar a el, push
        navigationController?.pushViewController(wikiSeasonViewController, animated: true)
        
    }
    
    @objc func displayEpisodes() {
        let episodeListViewController = EpisodeListViewController(model: model.sortedEpisodes)

        // Push
        navigationController?.pushViewController(episodeListViewController, animated: true)
    }
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        self.model = season
        syncModelWithView()
    }
}
