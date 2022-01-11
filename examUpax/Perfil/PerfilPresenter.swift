//
//  PerfilPresenter.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation

class PerfilPresenter {
    weak var _view: PerfilViewDelegate?
    var interactor: PerfilInteractorProtocol?
    var router: PerfilRouterProtocol?
    var delegate: PerfilPresenterProtocol?
}

extension PerfilPresenter: PerfilPresenterProtocol{
    func read_profile() {
        interactor?.parseJson()
    }
    
    
    
    func read_user() {
        interactor?.parseJson()
    }
    
    func responseOperations(operationResponse: EntityPerfil) {
        _view?.showUser(data: operationResponse)
    }
    
   
   
}
