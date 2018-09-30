//
//  WikiSeasonViewController.swift
//  Westeros
//
//  Created by German Hernandez on 30/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit
import WebKit

class WikiSeasonViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    // MARK: - Properties
    var model: Season
    
    // MARK: - Initialization
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Notifications
    @objc func seasonDidChange(notification: Notification) {
        // Sacar la info y Extraer la casa
        guard let info = notification.userInfo,
            let season: Season = info[Constants.SeasonKey] as? Season else { return }
        
        // Actualizar el modelo
        self.model = season
        
        // Sincronizar model - vista
        syncModelWithView()
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
        
        // Aqui nos damos de baja en las notificaciones
        // No nos interesa seguir recibiendo las acualizaciones de las casas
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asignar delegados
        webView.navigationDelegate = self
        // Sincronizar modelo y vista
        syncModelWithView()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        navigationItem.backBarButtonItem?.title = model.name
        title = model.name
        let request: URLRequest = URLRequest(url: model.wikiUrl)
        loadingView.startAnimating()
        webView.load(request)
    }
}

extension WikiSeasonViewController: WKNavigationDelegate { // Should, Will, Did
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        // Detener el spinner
//        loadingView.stopAnimating()
//        // Ocultarlo
//        loadingView.isHidden = true
//    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void){
        let type = navigationAction.navigationType
        
        switch type {
        case .linkActivated, .formSubmitted, .formResubmitted :
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
}
