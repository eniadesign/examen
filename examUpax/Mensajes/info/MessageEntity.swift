//
//  EntityPerfil.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//


struct MessageEntity: Codable {
    
    let messages: [MessageArray]
    
   
}

struct MessageArray: Codable{
   
    let titulo          :   String
    let descripcion     :   String
    let imagen          :   String
    let imgperfil       :   String
   
    
}
