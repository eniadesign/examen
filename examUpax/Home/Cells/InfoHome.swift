//
//  InfoHome.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 09/01/22.
//


struct InfoHome: Codable {
    
    let posts: [InfoArray]
    
   
}

struct InfoArray: Codable{
   
    let titulo          :   String
    let descripcion     :   String
    let imagen          :   String
    let imgperfil       :   String

    
}
