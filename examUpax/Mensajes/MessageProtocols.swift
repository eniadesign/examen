//
//  MessageProtocols.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation
/// Login Module View Protocol
protocol MessageViewDelegate: class {
    func showUser(data: MessageEntity)
    func notifyOperations()
    func getPerfilData()
}



//MARK: Interactor -
/// Login Module Interactor Protocol
protocol MessageInteractorProtocol:class {
    func parseJson()
   
}

//MARK: Presenter -
/// Login Module Presenter Protocol
protocol MessagePresenterProtocol:class {
    func read_user()
    func read_profile()
    func responseOperations(operationResponse: MessageEntity)
   
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Login Module Router Protocol
protocol MessageRouterProtocol:class {
   
}
