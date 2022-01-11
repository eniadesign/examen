//
//  Main.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import UIKit


class CustomTabBarController: UITabBarController {
    
    var usuario: String?
    var navigation = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        canScrollToTop = true
    }

    var canScrollToTop:Bool = true

   

    // Called when the view becomes unavailable
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       
    }

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        let Home =  HomeAppMain.createModule(navigation: navigation!, user: "")
        let navigationController = UINavigationController(rootViewController: Home)
        navigationController.title = ""
        navigationController.tabBarItem.image = UIImage(named: "home")
        
        
        let perfil = PerfilMain.createModule(navigation: navigation!, user: "")
        let secondNavigationController = UINavigationController(rootViewController: perfil)
        secondNavigationController.title = ""
        secondNavigationController.tabBarItem.image = UIImage(named: "profilesmall")
        
        let mensaje = MessageMain.createModule(navigation: navigation!, user: "")
        let messageNavigationController = UINavigationController(rootViewController: mensaje)
        messageNavigationController.title = ""
        messageNavigationController.tabBarItem.image = UIImage(named: "message.png")
        
        let notificaciones = NotifMain.createModule(navigation: navigation!, user: "")
        let notificacionesNavigationController = UINavigationController(rootViewController: notificaciones)
        notificacionesNavigationController.title = ""
        notificacionesNavigationController.tabBarItem.image = UIImage(named: "chat.png")

        let tablaDinamica = TablaMain.createModule(navigation: navigation!, user: "")
        let tablaDinamicaController = UINavigationController(rootViewController: tablaDinamica)
        tablaDinamicaController.title = ""
        tablaDinamicaController.tabBarItem.image = UIImage(named: "add.png")

       
        
        viewControllers = [navigationController, secondNavigationController, tablaDinamicaController, messageNavigationController, notificacionesNavigationController ]
        
        tabBar.isTranslucent = false
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.white.cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
        
        
    }
    
    
}



