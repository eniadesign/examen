//
//  Splash.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit

open class Splash {

    public static func createModule( navigation  : UINavigationController) -> UIViewController{
        
        let viewController  :   SplashScreenView?   =  SplashScreenView()
        if let view = viewController {
            view.navigation = navigation
            return view
        }
        return UIViewController()
    }
}
