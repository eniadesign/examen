//
//  MesssageMain.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//


import UIKit

class MessageView: UIViewController{
        
        weak var delegate: MessageViewDelegate?
        var presenter: MessagePresenter?
        private var ui = MessageViewUI()
        var getUser: String?
        
        
        override func loadView() {
            ui = MessageViewUI(navigation: self.navigationController!, getuser: getUser!)
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


extension MessageView: MessageViewDelegate{
  
    
    func getPerfilData() {
        
    }
    
    func getMessageData() {
        presenter?.read_profile()
       
    }
    
    
        func notifyOperations() {
            presenter?.read_user()
        }
        
        func showUser(data: MessageEntity) {
            
            ui.infoData = data
            ui.tabla.reloadData()           
        }
    }


