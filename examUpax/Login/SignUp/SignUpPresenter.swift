//
//  SignUpPresenter.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import UIKit

class SignUpPresenter {
    weak var _view: SignUpViewDelegate?
    var interactor: SignUpInteractorProtocol?
    var router: SignUpRouterProtocol?
    var delegate: SignUpPresenterProtocol?
    let db = Firestore.firestore()
}

extension SignUpPresenter: SignUpPresenterProtocol{
    func action_register(user: String, pass: String) {
        interactor?.registro(u: user, p: pass)
    }
    func onboarding() {
        self.router?.access()
    }
    func action_back() {
        router?.back()
    }
    
    func alerta(mensaje: String) {
        _view?.muestra_alerta(mensaje: mensaje)
    }
    
    
}
