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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .cyan
        
        // 1. Creamos el modelo
        let houses = Repository.local.houses
        
        // 2. Creamos los controladores
        // Master
        let houseListViewController = HouseListViewController(model: houses)
        let lastHouseSelected = houseListViewController.lastSelectedHouse()
        
        // Detail
        let houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
        
        // Asignar delegados
        // Un objeto SOLO puede tener un delegado
        // Sin embargo, un objeto, SÍ puede ser delegado de varios otros
        houseListViewController.delegate = houseDetailViewController
        
        // Creamos el combinador
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [
            houseListViewController.wrappedInNavigation(),
            houseDetailViewController.wrappedInNavigation()
        ]
        
//        var controllers = [UIViewController]()
        
//        for house in houses {
//            controllers.append( HouseDetailViewController(model : house).wrappedInNavigation())
//        }
        // FP
        // Queremos transformar un array d House en un array de HouseDetailVC
//        let controllers = houses.map { house in
//            HouseDetailViewController(model: house).wrappedInNavigation()
//        }
        // Omitimos el parametro
//        let controllers = houses.map {
//            HouseDetailViewController(model: $0).wrappedInNavigation()
//        }
//
//
//
//        // Creamos el combinador
//        let tabBarViewController = UITabBarController()
//        tabBarViewController.viewControllers =  controllers
//

        //Crear la tabla (lista)
       // let houseListViewController = HouseListViewController(model:houses)
        
        // Asignamos el rootVC
        //window?.rootViewController = tabBarViewController
        //window?.rootViewController = houseListViewController.wrappedInNavigation()
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

