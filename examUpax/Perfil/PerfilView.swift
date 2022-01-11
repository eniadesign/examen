//
//  PerfilView.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import UIKit

class PerfilView: UIViewController{
        
        weak var delegate: PerfilViewDelegate?
        var presenter: PerfilPresenter?
        private var ui = PerfilViewUI()
        var getUser: String?
        
        
        override func loadView() {
            ui = PerfilViewUI(navigation: self.navigationController!, getuser: getUser!)
            ui.delegate = self
            view = ui
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationController?.isNavigationBarHidden = true
            delegate = self
            delegate?.notifyOperations()
        }
      
    }


extension PerfilView: PerfilViewDelegate{
    func getPerfilData() {
        presenter?.read_profile()
        ui.infoperfil.reloadData()
    }
    
    
        func notifyOperations() {
            presenter?.read_user()
        }
        
        func showUser(data: EntityPerfil) {
            
            ui.infoData = data
            ui.tabla.reloadData()
            ui.perfilData = data
            ui.infoperfil.reloadData()
        }
    }


