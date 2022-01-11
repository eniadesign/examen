//
//  PerfilMain.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation
import UIKit

class PerfilMain {
    public static func createModule(navigation: UINavigationController, user: String)->UIViewController{
     
        let loginView: PerfilView? = PerfilView()
        
        if let view = loginView {
            
            let presenter = PerfilPresenter()
            let interactor = PerfilInteractor()
            let router = PerfilRouter()
            
            view.presenter = presenter
            view.getUser = user
            presenter._view = view
            presenter.interactor = interactor
            presenter.router = router
            
            interactor.presenter = presenter
            router.navigation = navigation
            
            return view
        }
        
        return UIViewController()
    }
}
