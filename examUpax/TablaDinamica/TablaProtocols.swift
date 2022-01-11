//
//  MessageProtocols.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation
/// Login Module View Protocol
protocol TablaViewDelegate: class {
    func showUser(data: TablaEntity)
    func notifyOperations()
    func getPerfilData()
    func preguntas(pregunta: String)
}



//MARK: Interactor -
/// Login Module Interactor Protocol
protocol TablaInteractorProtocol:class {
    func parseJson()
   
}

//MARK: Presenter -
/// Login Module Presenter Protocol
protocol TablaPresenterProtocol:class {
    func read_user()
    func read_profile()
    func responseOperations(operationResponse: TablaEntity)
   
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Login Module Router Protocol
protocol TablaRouterProtocol:class {
   
}
