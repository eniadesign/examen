//
//  SignUpProtocols.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation

/// Login Module View Protocol
protocol SignUpViewDelegate: class {
   func btn_back()
    func register(user: String, pass: String)
    func muestra_alerta(mensaje: String)
}

//MARK: Interactor -
/// Login Module Interactor Protocol
protocol SignUpInteractorProtocol:class {
    func registro(u: String, p: String)
}

//MARK: Presenter -
/// Login Module Presenter Protocol
protocol SignUpPresenterProtocol:class {
    func action_back()
    func action_register(user: String, pass: String)
    func onboarding()
    func alerta(mensaje: String)
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Login Module Router Protocol
protocol SignUpRouterProtocol:class {
   func back()
    func access()
}
