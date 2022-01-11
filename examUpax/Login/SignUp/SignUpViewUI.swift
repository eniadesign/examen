//
//  SignUpViewUI.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit

class SignUpViewUI: UIView {
    weak var delegate: SignUpViewDelegate?
    
    lazy var navigationBar: ComponentNavbar = {
        let navigationController = ComponentNavbar(frame: .zero)
        navigationController.backButton.addTarget(self, action: #selector(self.back), for: .touchUpInside)
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        return navigationController
    }()
    
    lazy var contentView: UIScrollView = {
        let scrollview = UIScrollView(frame: .zero)
        scrollview.keyboardDismissMode = .onDrag
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    lazy var titleText: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Regístrate"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textEmail: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Email Address"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textPass: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    lazy var inputEmail: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.keyboardType = .asciiCapable
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height+10))
        textfield.leftViewMode = .always
        textfield.placeholder = "EMAIL"
        textfield.returnKeyType = .next
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var inputPass: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.keyboardType = .asciiCapable
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height+10))
        textfield.leftViewMode = .always
        textfield.placeholder = "Password"
        textfield.returnKeyType = .next
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var signinButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .red
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        
        let stringAttribute = NSMutableAttributedString(string: "Registrarse", attributes: attributes)
        button.setAttributedTitle(stringAttribute, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUIElements()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    fileprivate func setupUIElements() {
        self.addSubview(navigationBar)
        self.addSubview(contentView)
        self.navigationBar.addSubview(titleText)
        self.addSubview(textEmail)
        self.addSubview(inputEmail)
        self.addSubview(textPass)
        self.addSubview(inputPass)
        self.addSubview(signinButton)
        
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            ///Barra de navegacion
            self.navigationBar.topAnchor.constraint(equalTo:self.topAnchor, constant: 0),
            self.navigationBar.leadingAnchor.constraint(equalTo:self.leadingAnchor, constant: 0),
            self.navigationBar.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: 0),
            
            ///Titulo
            self.titleText.topAnchor.constraint(equalTo: self.navigationBar.topAnchor, constant: 290),
            self.titleText.leadingAnchor.constraint(equalTo: self.navigationBar.leadingAnchor, constant: 10),
            self.titleText.trailingAnchor.constraint(equalTo: self.navigationBar.trailingAnchor, constant: -10),
            
            
            ///Contenido
            self.contentView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            self.textEmail.topAnchor.constraint(equalTo: self.titleText.topAnchor, constant: 90),
            self.textEmail.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            self.textEmail.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),

            self.inputEmail.topAnchor.constraint(equalTo: self.textEmail.topAnchor, constant: 25),
            self.inputEmail.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            self.inputEmail.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            
            self.textPass.topAnchor.constraint(equalTo: self.inputEmail.topAnchor, constant: 30),
            self.textPass.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            self.textPass.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),

            self.inputPass.topAnchor.constraint(equalTo: self.textPass.topAnchor, constant: 25),
            self.inputPass.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            self.inputPass.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),

            
            // Botones
            self.signinButton.topAnchor.constraint(equalTo: self.inputPass.topAnchor, constant: 35),
            self.signinButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            self.signinButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            

        ])
        
        self.signinButton.addTarget(self, action: #selector(self.register), for: .touchUpInside)
        
       
    }
    
    
    @objc func register(){
        delegate?.register(user: inputEmail.text!, pass: inputPass.text!)
    }
    
    @objc func back() {
        delegate?.btn_back()
    }
    
    
}
