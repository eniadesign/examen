//
//  HomeAppProtocols.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation

/// Login Module View Protocol
protocol HomeAppViewDelegate: class {
    func showUser(data: InfoHome)
    func notifyOperations()
}



//MARK: Interactor -
/// Login Module Interactor Protocol
protocol HomeAppInteractorProtocol:class {
   func parseJson()
}

//MARK: Presenter -
/// Login Module Presenter Protocol
protocol HomeAppPresenterProtocol:class {
   func read_user()
    func responseOperations(operationResponse: InfoHome)
   
}

//MARK: Router (hay quienes dicen: Wireframe) -
/// Login Module Router Protocol
protocol HomeAppRouterProtocol:class {
   
}
