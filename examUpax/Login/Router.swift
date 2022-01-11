//
//  Router.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit


class HomeRouter {
    var navigation: UINavigationController?
}

extension HomeRouter: HomeRouterProtocol{
    
    func screen_signup(){
        let vc = SignUpMain.createModule(navigation: self.navigation!)
        navigation?.pushViewController(vc, animated: true)
    }
    
    func login(user: String) {
        
//        let vc = HomeAppMain.createModule(navigation: self.navigation!, user: user)
//        navigation?.pushViewController(vc, animated: true)
//
        
        let vc = CustomTabBarController()
        navigation?.pushViewController(vc, animated: true)
        
        
    }
    
}


