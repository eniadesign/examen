//
//  MessageMain.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import UIKit

class MessageMain {
    public static func createModule(navigation: UINavigationController, user: String)->UIViewController{
     
        let loginView: MessageView? = MessageView()
        
        if let view = loginView {
            
            let presenter = MessagePresenter()
            let interactor = MessageInteractor()
            let router = MessageRouter()
            
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
