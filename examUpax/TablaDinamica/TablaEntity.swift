//
//  EntityPerfil.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//


struct TablaEntity: Codable {
    
    let colors: [String]
    let questions: [TablaQuestions]
}

struct TablaQuestions: Codable{

    let total          :   Int?
    let text           :   String
    let chartData      :   [chartData]
    
    enum CodingKeys: String, CodingKey {
           case total = "total"
        case text = "text"
        case chartData = "chartData"
       }
}

struct chartData: Codable{
    let text          :   String
    let percetnage    :   Int?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case percetnage = "percetnage"
       }
}
