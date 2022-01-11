//
//  HomeView.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit


class HomeView: UIViewController, UITextFieldDelegate {
    
    weak var delegate: HomeViewDelegate?
    var presenter: HomePresenterProtocol?
    var activeField: UITextField?
    
    
    lazy var navigationBar: ComponentNavbar = {
        let navigationController = ComponentNavbar(frame: .zero)
        navigationController.backButton.isHidden = true
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        return navigationController
    }()
    
    lazy var titleText: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Hello !!"
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
        textfield.text = "am.hesp@outlook.com"
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
        textfield.text = "123456"
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
        
        let stringAttribute = NSMutableAttributedString(string: "Entrar", attributes: attributes)
        button.setAttributedTitle(stringAttribute, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var signUp: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .white
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
        
        let stringAttribute = NSMutableAttributedString(string: "Registrarse", attributes: attributes)
        button.setAttributedTitle(stringAttribute, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            ///Barra de navegacion
            self.navigationBar.topAnchor.constraint(equalTo:view.topAnchor, constant: 0),
            self.navigationBar.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 0),
            self.navigationBar.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: 0),
            
            ///Titulo
            self.titleText.topAnchor.constraint(equalTo: self.navigationBar.topAnchor, constant: 290),
            self.titleText.leadingAnchor.constraint(equalTo: self.navigationBar.leadingAnchor, constant: 10),
            self.titleText.trailingAnchor.constraint(equalTo: self.navigationBar.trailingAnchor, constant: -10),
            
            
            ///Contenido
            self.textEmail.topAnchor.constraint(equalTo: self.titleText.topAnchor, constant: 60),
            self.textEmail.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.textEmail.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.inputEmail.topAnchor.constraint(equalTo: self.textEmail.topAnchor, constant: 25),
            self.inputEmail.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.inputEmail.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.textPass.topAnchor.constraint(equalTo: self.inputEmail.topAnchor, constant: 30),
            self.textPass.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.textPass.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.inputPass.topAnchor.constraint(equalTo: self.textPass.topAnchor, constant: 25),
            self.inputPass.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.inputPass.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            
            // Botones
            self.signinButton.topAnchor.constraint(equalTo: self.inputPass.topAnchor, constant: 35),
            self.signinButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.signinButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.signUp.topAnchor.constraint(equalTo: self.signinButton.topAnchor, constant: 35),
            self.signUp.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.signUp.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
        ])
    }
    
    @objc func login(){
        if(!inputEmail.text!.isEmpty && !inputPass.text!.isEmpty){
            delegate?.action_login(user: inputEmail.text!, pass: inputPass.text!)
        }else{
            print("error")
        }
    }
    
    
    @objc func signup(){
        delegate?.action_signup()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(navigationBar)
        view.addSubview(titleText)
        view.addSubview(textEmail)
        view.addSubview(inputEmail)
        view.addSubview(textPass)
        view.addSubview(inputPass)
        view.addSubview(signinButton)
        view.addSubview(signUp)
        
        setupConstraints()
        self.delegate = self
        inputEmail.delegate = self
        inputPass.delegate = self
      
        
        self.signinButton.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        
        self.signUp.addTarget(self, action: #selector(self.signup), for: .touchUpInside)
        
    }
    
    
    
    
    
    // Start Editing The Text Field
       func textFieldDidBeginEditing(_ textField: UITextField) {
           moveTextField(textField, moveDistance: -250, up: true)
       }
       
       // Finish Editing The Text Field
       func textFieldDidEndEditing(_ textField: UITextField) {
           moveTextField(textField, moveDistance: -250, up: false)
       }
       
       // Hide the keyboard when the return key pressed
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
       
       // Move the text field in a pretty animation!
       func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
           let moveDuration = 0.3
           let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
           
           UIView.beginAnimations("animateTextField", context: nil)
           UIView.setAnimationBeginsFromCurrentState(true)
           UIView.setAnimationDuration(moveDuration)
           self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
           UIView.commitAnimations()
       }
    
    
    
    
}








extension HomeView: HomeViewDelegate{
    
    func muestra_alerta(mensaje: String) {
        let alert = UIAlertController(title: "Alert", message: "\(mensaje)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func action_signup() {
        presenter?.screen_signUp()
    }
    
    
    func action_login(user: String, pass: String) {
        presenter?.usuarioRegistrado(u: user, p: pass)
    }
    
}
