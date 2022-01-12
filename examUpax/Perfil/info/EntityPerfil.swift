//
//  EntityPerfil.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//


struct EntityPerfil: Codable {
    
    let profile: [PerfilArray]
    
   
}

struct PerfilArray: Codable{
    let nombre          :   String
    let follower        :   String
    let following       :   String
    let posts           :   String
    let titulo          :   String
    let descripcion     :   String
    let imagen          :   String
    let imgperfil       :   String
    let items           :   [String]
    let ciudad          :   String

    
}
