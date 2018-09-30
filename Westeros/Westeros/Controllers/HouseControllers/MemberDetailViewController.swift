//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by German Hernandez on 30/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    // MARK: - Properties
    var model: Person
    
    // MARK: - Outlets
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var memberAliasLabel: UILabel!
  
    init(model:Person) {
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
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sincronizar modelo y vista
        syncModelWithView()
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification) {
        // Sacar la info y Extraer la temporada
        guard let info = notification.userInfo,
            let house: House = info[Constants.HouseKey] as? House else { return }
        
        let memberListViewController = MemberListVC(model: house.sortedMembers)
        
        // Push
        navigationController?.pushViewController(memberListViewController, animated: true)
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        memberNameLabel.text = "\(model.name)"
        memberAliasLabel.text = model.alias
    }
}
