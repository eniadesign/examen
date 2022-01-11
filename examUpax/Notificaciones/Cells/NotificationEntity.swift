//
//  EntityPerfil.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//


struct NotificationEntity: Codable {
    
    let notif: [NotificationArray]
    
   
}

struct NotificationArray: Codable{
   
    let titulo          :   String
    let descripcion     :   String
    let subtitulo       :   String
    let imgperfil       :   String

   
    
}
