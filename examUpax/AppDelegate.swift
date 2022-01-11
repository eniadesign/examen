//
//  AppDelegate.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit
import Firebase


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.navigationController     =   UINavigationController()
        navigationController?.isNavigationBarHidden = true

        // MARK: Firebase
        FirebaseApp.configure()
        
        
        
        self.navigationController     =   UINavigationController()
        navigationController?.isNavigationBarHidden = true
        let splashScreen = Splash.createModule(navigation: navigationController!)
        navigationController?.initRootViewController(splashScreen)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
        return true
    }


}

