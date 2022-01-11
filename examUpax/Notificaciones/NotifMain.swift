//
//  MessageMain.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import UIKit

class NotifMain {
    public static func createModule(navigation: UINavigationController, user: String)->UIViewController{
     
        let loginView: NotifView? = NotifView()
        
        if let view = loginView {
            
            let presenter = NotifPresenter()
            let interactor = NotifInteractor()
            let router = NotifRouter()
            
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
