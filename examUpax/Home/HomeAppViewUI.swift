//
//  HomeAppViewUI.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit
import DropDown

class HomeAppViewUI: UIView{
    
    weak var delegate: HomeAppViewDelegate?
    var user: String?
    let dropDown = DropDown()
    var infoData: InfoHome?{
        didSet{
            tabla.reloadData()
        }
    }
    
   
    lazy var navigationBar: ComponentNavbarHome = {
        let navigationController = ComponentNavbarHome(frame: .zero)
        navigationController.backButton.isHidden = true
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        return navigationController
    }()
    
    lazy var contentView: UIScrollView = {
        let scrollview = UIScrollView(frame: .zero)
        scrollview.keyboardDismissMode = .onDrag
        scrollview.isScrollEnabled = true
        
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    lazy var buttonshow: UIButton = {
        let boton = UIButton(frame: .zero)
        boton.titleLabel?.textAlignment = .left
        boton.addTarget(self, action: #selector(self.showCat), for: .touchUpInside)
        boton.tintColor = UIColor.black
        let image = UIImage(named: "downward") as UIImage?
        let button   = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.frame = CGRect(x: 120, y: 15, width: 10, height: 10)
        button.addTarget(self, action: #selector(self.showCat), for: .touchUpInside)
        button.setImage(image, for: .normal)
        boton.addSubview(button)

        boton.translatesAutoresizingMaskIntoConstraints = false
        return boton
    }()
    
    private lazy var contenedorInfo: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleText: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var card: CardView = {
        let view = CardView(cornerRadius: 0, shadowRadius: 0, shadowOffset: CGSize(width: 0, height: 0), shadowColor: .clear, shadowOpacity: 0, background: .clear)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tabla: UITableView = {
        let tableview = UITableView(frame: .zero)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.register(Info_cell.self, forCellReuseIdentifier: "infoCell")
        tableview.tableFooterView = UIView()
        tableview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    
    public convenience init(navigation: UINavigationController, getuser: String){
        self.init()
        setupUIElements()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        dropDown.anchorView = navigationBar
        dropDown.dataSource = ["Categoría Uno", "Categoría Dos", "Categoría Tres"]
        dropDown.dismissMode = .automatic
        dropDown.selectRow(at: 0)
        dropDown.direction = .any
        DropDown.startListeningToKeyboard()
        dropDown.hide()
        dropDown.width = 200
        buttonshow.setTitle("All Categories", for: .normal)
        buttonshow.setTitleColor(UIColor.black, for: .normal)
        buttonshow.titleLabel?.textColor = UIColor.black
        buttonshow.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        buttonshow.layer.zPosition = 10
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            buttonshow.setTitle(item, for: .normal)
        }
        dropDown.topOffset = CGPoint(x: 10, y:20)
        dropDown.bottomOffset = CGPoint(x: 0, y:68)
        
        tabla.reloadData()
        setupUIElements()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    @objc func showCat() {
        dropDown.show()
        delegate?.notifyOperations()
    }
    
    fileprivate func setupUIElements() {
        self.addSubview(navigationBar)
        self.addSubview(buttonshow)
        self.addSubview(dropDown)
        self.addSubview(contenedorInfo)
        self.contenedorInfo.addSubview(tabla)
        
    }
    
   
    
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
//            ///Barra de navegacion
            self.navigationBar.topAnchor.constraint(equalTo:self.topAnchor, constant: 0),
            self.navigationBar.leadingAnchor.constraint(equalTo:self.leadingAnchor, constant: 0),
            self.navigationBar.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: 0),
            self.navigationBar.bottomAnchor.constraint(equalTo:self.tabla.topAnchor, constant: 0),

            self.buttonshow.topAnchor.constraint(equalTo:self.topAnchor, constant: 20),
            self.buttonshow.leadingAnchor.constraint(equalTo:self.leadingAnchor, constant: 10),
            self.buttonshow.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: 0),

            self.dropDown.topAnchor.constraint(equalTo:self.topAnchor, constant: 50),
            self.dropDown.leadingAnchor.constraint(equalTo:self.leadingAnchor, constant: 10),
            self.dropDown.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: 0),

            //Contenido
            contenedorInfo.topAnchor.constraint(equalTo: self.navigationBar.bottomAnchor, constant: 10),
            contenedorInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            contenedorInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.contenedorInfo.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            tabla.topAnchor.constraint(equalTo: self.contenedorInfo.topAnchor, constant: 10),
            tabla.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tabla.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.tabla.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),

            
            
           

        ])
    }
    
}

extension HomeAppViewUI: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoData?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! Info_cell
       
        let imageMain = URL(string: (infoData?.posts[indexPath.row].imagen)!)!
        let imageProfile = URL(string: (infoData?.posts[indexPath.row].imgperfil)!)!
        
        if let imagenPerfil = try? Data(contentsOf: imageProfile) {
            cell.imageProfile.image = UIImage(data: imagenPerfil)
        }
       
            if let imagenPrincipal = try? Data(contentsOf: imageMain) {
                cell.titleDescription.text = infoData?.posts[indexPath.row].titulo
                cell.titlemain.text = infoData?.posts[indexPath.row].descripcion
                cell.imageMain.image = UIImage(data: imagenPrincipal)
            }
    
        return  cell
    }
    
   
}
