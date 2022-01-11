//
//  HomAppView.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit

class HomeAppView: UIViewController{
    
    let MyDelegate = UIApplication.shared.delegate as! AppDelegate
    var navController:UINavigationController!
    weak var delegate: HomeAppViewDelegate?
    var presenter: HomeAppPresenter?
    private var ui = HomeAppViewUI()
    var getUser: String?
    
    
    override func loadView() {
        ui = HomeAppViewUI(navigation: self.navigationController!, getuser: getUser!)
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


extension HomeAppView: HomeAppViewDelegate{
    func notifyOperations() {
        presenter?.read_user()
    }
    
    func showUser(data: InfoHome) {
        
        ui.infoData = data
        ui.tabla.reloadData()
    }
}


