//
//  SignUpRouter.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit

class SignUpRouter {
    var navigation: UINavigationController?
}

extension SignUpRouter: SignUpRouterProtocol{
    
    func access() {
        let vc = CustomTabBarController()
        navigation?.pushViewController(vc, animated: true)
    }
    
    
    func back() {
        let vc = HomeMain.createModule(navigation: self.navigation!)
        navigation?.pushViewController(vc, animated: true)
    }
}
