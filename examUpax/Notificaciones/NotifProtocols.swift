//
//  MessageProtocols.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation
/// Login Module View Protocol
protocol NotifViewDelegate: class {
    func showUser(data: NotificationEntity)
    func notifyOperations()
    func getPerfilData()
}



//MARK: Interactor -
/// Login Module Interactor Protocol
protocol NotifInteractorProtocol:class {
    func parseJson()
   
}

//MARK: Presenter -
/// Login Module Presenter Protocol
protocol NotifPresenterProtocol:class {
    func read_user()
    func read_profile()
    func responseOperations(operationResponse: NotificationEntity)
   
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Login Module Router Protocol
protocol NotifRouterProtocol:class {
   
}
