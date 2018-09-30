//
//  AppDelegate.swift
//  Westeros
//
//  Created by German Hernandez on 16/9/18.
//  Copyright © 2018 German Hernandez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarViewController: UITabBarController?
    var splitViewController: UISplitViewController?
    var houseDetailViewController: HouseDetailViewController?
    var seasonDetailViewController: SeasonDetailViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .cyan
        
        // 1. Creamos el modelo
        let houseRepo = HouseFactory()
        let houses = houseRepo.getAll()
        let seasonRepo = SeasonFactory()
        let seasons = seasonRepo.getAll()
        
        // 2. Creamos los controladores
        // Master
        let houseListViewController = HouseListViewController(model: houses)
        let lastHouseSelected = houseListViewController.lastSelectedHouse()
        
       // let memberListViewController = MemberListViewController(model:)
        let seasonListViewController = SeasonListViewController(model:seasons)
        let lastSeasonSelected = seasonListViewController.lastSelectedSeason()
       
        // Detail
        houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
        seasonDetailViewController = SeasonDetailViewController(model: lastSeasonSelected)
        
        // Asignar delegados
        // Un objeto SOLO puede tener un delegado
        // Sin embargo, un objeto, SÍ puede ser delegado de varios otros
        houseListViewController.delegate = houseDetailViewController
        seasonListViewController.delegate = seasonDetailViewController
        
        // Creamos el combinador
        tabBarViewController = UITabBarController()
        tabBarViewController?.viewControllers = [seasonListViewController.wrappedInNavigation(), houseListViewController.wrappedInNavigation()]
        tabBarViewController?.delegate = self
        tabBarViewController?.selectedIndex = UserDefaults.standard.integer(forKey: Constants.LastTapSelected)
        
        splitViewController = UISplitViewController()
        splitViewController?.viewControllers = [
            tabBarViewController,
            lastTabSelected()
            ] as! [UIViewController]
        
        // Asignamos el rootVC
        window?.rootViewController = splitViewController
        
        
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
 
extension AppDelegate: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedTab = tabBarController.selectedIndex
        splitViewController?.viewControllers[1] = tabNav(at: selectedTab).wrappedInNavigation()
       
        // Guardamos el ultimo tab seleccionado
        saveLastSelectedTab(at: selectedTab)
    }
}

extension AppDelegate {
    func saveLastSelectedTab(at position: Int) {
        // Aqui vamos a guardar la ultima casa seleccionada
        let userDefaults = UserDefaults.standard
        
        // Lo insertamos en el diccionario de User Defaults
        userDefaults.set(position, forKey: Constants.LastTapSelected)
        
        // Guardar
        userDefaults.synchronize() // Por si acaso
    }
    
    func lastTabSelected() -> UINavigationController {
        // Averiguar cual es la ultima row seleccionada (si la hay)
        let pos = UserDefaults.standard.integer(forKey: Constants.LastTapSelected) // Value 0 es el default
        return tabNav(at: pos).wrappedInNavigation()
    }
    
    func tabNav(at position: Int) -> UIViewController {
        switch position {
        case 0:
            return seasonDetailViewController!
        case 1:
            return houseDetailViewController!
        default:
            return seasonDetailViewController!
         }
       
    }
}

