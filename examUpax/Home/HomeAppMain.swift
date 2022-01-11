//
//  HomeAppMain.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation
import UIKit

class HomeAppMain {
    public static func createModule(navigation: UINavigationController, user: String)->UIViewController{
     
        let loginView: HomeAppView? = HomeAppView()
        
        if let view = loginView {
            
            let presenter = HomeAppPresenter()
            let interactor = HomeAppInteractor()
            let router = HomeAppRouter()
            
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
