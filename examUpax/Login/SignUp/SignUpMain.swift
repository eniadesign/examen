//
//  SignUpMain.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation
import UIKit

class SignUpMain {
    public static func createModule(navigation: UINavigationController)->UIViewController{
     
        let ViewController: SignUpView? = SignUpView()
        
        if let view = ViewController {
            
            let presenter = SignUpPresenter()
            let interactor = SignUpInteractor()
            let router = SignUpRouter()
            
            view.presenter = presenter
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
