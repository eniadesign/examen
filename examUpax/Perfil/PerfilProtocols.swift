//
//  PerfilProtocols.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation

/// Login Module View Protocol
protocol PerfilViewDelegate: class {
    func showUser(data: EntityPerfil)
    func notifyOperations()
    func getPerfilData()
}



//MARK: Interactor -
/// Login Module Interactor Protocol
protocol PerfilInteractorProtocol:class {
    func parseJson()
   
}

//MARK: Presenter -
/// Login Module Presenter Protocol
protocol PerfilPresenterProtocol:class {
    func read_user()
    func read_profile()
    func responseOperations(operationResponse: EntityPerfil)
   
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Login Module Router Protocol
protocol PerfilRouterProtocol:class {
   
}
