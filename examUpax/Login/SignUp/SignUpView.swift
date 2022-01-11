//
//  SignUpView.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import Foundation
import UIKit

class SignUpView: UIViewController {
    
    weak var delegate: SignUpViewDelegate?
    var presenter: SignUpPresenterProtocol?
    private var ui = SignUpViewUI()
    
    override func loadView() {
        ui.delegate = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SignUpView: SignUpViewDelegate{
    
    func muestra_alerta(mensaje: String) {
        let alert = UIAlertController(title: "Alert", message: "\(mensaje)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func btn_back() {
        presenter?.action_back()
    }
    
    func register(user: String, pass: String){
        presenter?.action_register(user: user, pass: pass)
    }
}
