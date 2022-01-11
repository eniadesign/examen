//
//  SignUpInteractor.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class SignUpInteractor {
    var presenter: SignUpPresenterProtocol?
    let db = Firestore.firestore()
}

extension SignUpInteractor: SignUpInteractorProtocol{
    func registro(u: String, p: String) {
        Auth.auth().createUser(withEmail: u, password: p){ (result, error) in
            if let _ = result, error == nil{
                // Add a new document with a generated ID
                var ref: DocumentReference? = nil
                ref = self.db.collection("usuarios").addDocument(data: [
                    "email": u,
                    "imagen": "sin imagen",
                    "passwd": p
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
                self.presenter?.onboarding()
            }else{
                self.presenter?.alerta(mensaje: "\(error?.localizedDescription ?? "")")
                
            }
        }
    }
    
    
}
