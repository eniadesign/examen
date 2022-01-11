//
//  MessageInteractor.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import Foundation
class TablaInteractor{
    var presenter: TablaPresenterProtocol?
}

extension TablaInteractor: TablaInteractorProtocol {
   
    
    func parseJson() {
        
       //Pruebas locales por falta de internet
//        guard let path = Bundle.main.path(forResource: "tabla", ofType: "json")
//        else{
//            return
//        }
        //let url = URL(fileURLWithPath: path2)
        
        
        let path2 = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
        let url = URL(string: path2)

        var result: TablaEntity?
        
        do {
            let jsonData = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            result = try decoder.decode(TablaEntity.self, from: jsonData)
            if let result = result{
                presenter?.responseOperations(operationResponse: result)
                
            }
        }
        catch {
            print("error: \(error)")
        }
        
    }
    
    
}

