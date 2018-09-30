//
//  WikiViewController.swift
//  Westeros
//
//  Created by German Hernandez on 22/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    // MARK: - Properties
    var model: House
    
    // MARK: - Initialization
    init(model: House) {
        // 1. Limpio mi M***
        self.model = model
        // 2. Llamo a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        
        // 3. Usas las properties de tu superclase
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification) {
        // Sacar la info y Extraer la casa
        guard let info = notification.userInfo,
            let house: House = info[Constants.HouseKey] as? House else { return }
        
        // Actualizar el modelo
        self.model = house
        
        // Sincronizar model - vista
        syncModelWithView()
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Nos damos de alta en las notificaciones, osea, me subscribo a aquellos eventos que me interesan
        // En este caso, me quiero enterar de cuando se cambia una casa
        // Quiero observar los cambios de casa ( notificacion con nomber HouseDidChangeNotifiactionName
        // Y cuando ocurra, quiero ejecutar houseDidChange
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange),
                                       name: .houseDidChangeNotification,
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

extension WikiViewController: WKNavigationDelegate { // Should, Will, Did
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Detener el spinner
        loadingView.stopAnimating()
        // Ocultarlo
        loadingView.isHidden = true
    }
    
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
