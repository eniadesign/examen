//
//  Presenter.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation
import Firebase
import UIKit

class HomePresenter {
    weak var _view: HomeViewDelegate?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    var delegate: HomePresenterProtocol?
    var handle: AuthStateDidChangeListenerHandle?
}


extension HomePresenter: HomePresenterProtocol{
    func usuarioRegistrado(u: String, p: String) {
        interactor?.firebaseLog(u: u, p: p)
    }
    
    func screen_signUp() {
        self.router?.screen_signup()
    }
    
    func signUp(u: String, p: String){
        self.router?.login(user: u)
    }
    
    func gotoSignIn(u: String, p: String){
        self.router?.login(user: u)
    }
    
    func alerta(mensaje: String) {
        _view?.muestra_alerta(mensaje: mensaje)
    }
    
}
