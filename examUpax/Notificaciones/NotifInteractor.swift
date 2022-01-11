//
//  MessageInteractor.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation
class NotifInteractor{
    var presenter: NotifPresenterProtocol?
}

extension NotifInteractor: NotifInteractorProtocol {
   
    
    func parseJson() {
       
        guard let path = Bundle.main.path(forResource: "alertas", ofType: "json")
        else{
            return
        }
        let url = URL(fileURLWithPath: path)
        var result: NotificationEntity?
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            result = try decoder.decode(NotificationEntity.self, from: jsonData)
            if let result = result{
                presenter?.responseOperations(operationResponse: result)
                
            }
        }
        catch {
            print("error: \(error)")
        }
        
    }
    
    
}

