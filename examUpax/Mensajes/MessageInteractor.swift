//
//  MessageInteractor.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation
class MessageInteractor{
    var presenter: MessagePresenterProtocol?
}

extension MessageInteractor: MessageInteractorProtocol {
   
    
    func parseJson() {
       
        guard let path = Bundle.main.path(forResource: "mensajes", ofType: "json")
        else{
            return
        }
        let url = URL(fileURLWithPath: path)
        var result: MessageEntity?
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            result = try decoder.decode(MessageEntity.self, from: jsonData)
            if let result = result{
                presenter?.responseOperations(operationResponse: result)
                
            }
        }
        catch {
            print("error: \(error)")
        }
        
    }
    
    
}

