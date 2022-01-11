//
//  HomeAppInteractor.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit

class HomeAppInteractor{
    var presenter: HomeAppPresenterProtocol?
}

extension HomeAppInteractor: HomeAppInteractorProtocol {
    func parseJson() {
       
        guard let path = Bundle.main.path(forResource: "infohome", ofType: "json")
        else{
            return
        }
        let url = URL(fileURLWithPath: path)
        var result: InfoHome?
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            result = try decoder.decode(InfoHome.self, from: jsonData)
            if let result = result{
                presenter?.responseOperations(operationResponse: result)
                
            }
        }
        catch {
            print("error: \(error)")
        }
        
    }
    
    
}
