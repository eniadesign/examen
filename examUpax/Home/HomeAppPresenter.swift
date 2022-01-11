//
//  HomeAppPresenter.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation
import Firebase

class HomeAppPresenter {
    weak var _view: HomeAppViewDelegate?
    var interactor: HomeAppInteractorProtocol?
    var router: HomeAppRouterProtocol?
    var delegate: HomeAppPresenterProtocol?
}

extension HomeAppPresenter: HomeAppPresenterProtocol{
    
    
    func read_user() {
        interactor?.parseJson()
    }
    
    func responseOperations(operationResponse: InfoHome) {
        _view?.showUser(data: operationResponse)
    }
    
   
   
}
