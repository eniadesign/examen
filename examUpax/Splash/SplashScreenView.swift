//
//  SplashScreenView.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit

class SplashScreenView: UIViewController {
    
    var navigation: UINavigationController?
    lazy var logoImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "splashscreenLogo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let login = HomeMain.createModule(navigation: self.navigation!)
            self.navigation?.pushViewController(login, animated: true)
        }
    }
    
    fileprivate func setupUIElements() {
        self.view.backgroundColor = .white
        self.view.addSubview(logoImage)
    }
    
    fileprivate func setupConstraints() {
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                logoImage.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.85, constant: 0),
                logoImage.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5, constant: 0),
                logoImage.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
                logoImage.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                logoImage.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85, constant: 0),
                logoImage.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5, constant: 0),
                logoImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            ])
        }
    }
}
