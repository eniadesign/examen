//
//  PerfilInteractor.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation

class PerfilInteractor{
    var presenter: PerfilPresenterProtocol?
}

extension PerfilInteractor: PerfilInteractorProtocol {
    func parseJson() {
       
        guard let path = Bundle.main.path(forResource: "infoprofile", ofType: "json")
        else{
            return
        }
        let url = URL(fileURLWithPath: path)
        var result: EntityPerfil?
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            result = try decoder.decode(EntityPerfil.self, from: jsonData)
            if let result = result{
                presenter?.responseOperations(operationResponse: result)
                
            }
        }
        catch {
            print("error: \(error)")
        }
        
    }
    
    
}

