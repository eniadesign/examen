//
//  Protocols.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation

/// Login Module View Protocol
protocol HomeViewDelegate: class {
    func action_login(user: String, pass: String)
    func action_signup()
    func muestra_alerta(mensaje: String)
}

//MARK: Interactor -
/// Login Module Interactor Protocol
protocol HomeInteractorProtocol:class {
    func firebaseLog(u: String, p: String)
    func firebaseSignUp(u: String, p: String)
}

//MARK: Presenter -
/// Login Module Presenter Protocol
protocol HomePresenterProtocol:class {
    func gotoSignIn(u: String, p: String)
    func signUp(u: String, p: String)
    func screen_signUp()
    func usuarioRegistrado(u: String, p: String)
    func alerta(mensaje: String)
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Login Module Router Protocol
protocol HomeRouterProtocol:class {
    func login(user: String)
    func screen_signup()
}
