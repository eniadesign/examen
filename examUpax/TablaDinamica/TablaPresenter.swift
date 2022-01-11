//
//  MessagePresenter.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation

class TablaPresenter {
    weak var _view: TablaViewDelegate?
    var interactor: TablaInteractorProtocol?
    var router: TablaRouterProtocol?
    var delegate: TablaPresenterProtocol?
    var colores: [String] = []
    var n: Int? = 0
    var number: Int? = 0
}

extension TablaPresenter: TablaPresenterProtocol{
    func read_profile() {
        interactor?.parseJson()
    }
    
    
    
    func read_user() {
        interactor?.parseJson()
    }
    
    func responseOperations(operationResponse: TablaEntity) {
        _view?.showUser(data: operationResponse)
    }
    
   
   
}
