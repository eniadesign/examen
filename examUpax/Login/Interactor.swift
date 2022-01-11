//
//  Interactor.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation
import FirebaseAuth


class HomeInteractor {
    var presenter: HomePresenterProtocol?
    var handle: AuthStateDidChangeListenerHandle?
}

extension HomeInteractor: HomeInteractorProtocol {
    func firebaseSignUp(u: String, p: String) {
        Auth.auth().createUser(withEmail: u, password: p){ (result, error) in
            if let _ = result, error == nil{
                self.presenter?.signUp(u: u, p: p)
            }else{
                self.presenter?.alerta(mensaje: "\(error?.localizedDescription ?? "")")
                
            }
        }
    }
    
    
    func firebaseLog(u: String, p: String) {
                Auth.auth().signIn(withEmail: u, password: p){ (result, error) in
                    if let _ = result, error == nil{
                        self.handle = Auth.auth().addStateDidChangeListener { auth, user in
                            if let user = user {
                              let uid = user.uid
                              let email = user.email
                                _ = user.photoURL
                              var multiFactorString = "MultiFactor: "
                              for info in user.multiFactor.enrolledFactors {
                                multiFactorString += info.displayName ?? "[DispayName]"
                                multiFactorString += " "
                              }
                                self.presenter!.gotoSignIn(u: email!, p: uid)
                               
                            }
        
        
                        }
        
                    }else{
                        self.presenter?.alerta(mensaje: "\(error?.localizedDescription ?? "")")
                       
                    }
                }
    }
    
    
}
