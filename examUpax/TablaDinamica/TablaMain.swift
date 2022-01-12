//
//  MessageMain.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import UIKit

class TablaMain {
    public static func createModule(navigation: UINavigationController, user: String)->UIViewController{
     
        let loginView: TablaView? = TablaView()
        
        if let view = loginView {
            
            let presenter = TablaPresenter()
            let interactor = TablaInteractor()
            let router = TablaRouter()
            
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
