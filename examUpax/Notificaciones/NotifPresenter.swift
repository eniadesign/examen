//
//  MessagePresenter.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation

class NotifPresenter {
    weak var _view: NotifViewDelegate?
    var interactor: NotifInteractorProtocol?
    var router: NotifRouterProtocol?
    var delegate: NotifPresenterProtocol?
}

extension NotifPresenter: NotifPresenterProtocol{
    func read_profile() {
        interactor?.parseJson()
    }
    
    
    
    func read_user() {
        interactor?.parseJson()
    }
    
    func responseOperations(operationResponse: NotificationEntity) {
        _view?.showUser(data: operationResponse)
    }
    
   
   
}
