//
//  MesssageMain.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//


import UIKit

class NotifView: UIViewController{
        
        weak var delegate: NotifViewDelegate?
        var presenter: NotifPresenter?
        private var ui = NotifViewUI()
        var getUser: String?
        
        
        override func loadView() {
            ui = NotifViewUI(navigation: self.navigationController!, getuser: getUser!)
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


extension NotifView: NotifViewDelegate{
   
    
    func getPerfilData() {
        
    }
    
    func getMessageData() {
        presenter?.read_profile()
    }
    
    
        func notifyOperations() {
            presenter?.read_user()
        }
        
        func showUser(data: NotificationEntity) {
            
            ui.infoData = data
            ui.tabla.reloadData()
           
        }
    }


