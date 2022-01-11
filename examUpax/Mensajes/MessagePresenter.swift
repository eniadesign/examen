//
//  MessagePresenter.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation

class MessagePresenter {
    weak var _view: MessageViewDelegate?
    var interactor: MessageInteractorProtocol?
    var router: MessageRouterProtocol?
    var delegate: MessagePresenterProtocol?
}

extension MessagePresenter: MessagePresenterProtocol{
    func read_profile() {
        interactor?.parseJson()
    }
    
    
    
    func read_user() {
        interactor?.parseJson()
    }
    
    func responseOperations(operationResponse: MessageEntity) {
        _view?.showUser(data: operationResponse)
    }
    
   
   
}
