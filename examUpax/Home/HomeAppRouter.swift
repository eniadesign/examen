//
//  HomeAppRouter.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation
import UIKit

class HomeAppRouter {
    var navigation: UINavigationController?
}

extension HomeAppRouter: HomeAppRouterProtocol{
    
    func openProfile(user: String) {
        
//        let vc = PerfilMain.createModule(navigation: self.navigation!, user: user)
//        navigation?.pushViewController(vc, animated: true)
//
        let vc = CustomTabBarController()
        navigation?.pushViewController(vc, animated: true)
       
        
    }
}

