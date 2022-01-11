//
//  PerfilViewUI.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import UIKit


class PerfilViewUI: UIView{
    
    weak var delegate: PerfilViewDelegate?
    var user: String?
    private let itemsPerRow: CGFloat = 3
    var infoData: EntityPerfil?{
        didSet{
            tabla.reloadData()
        }
    }
    
    var perfilData: EntityPerfil?{
        didSet{
            infoperfil.reloadData()
        }
    }
    
   
    lazy var navigationBar: ComponentNavbarHome = {
        let navigationController = ComponentNavbarHome(frame: .zero)
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        return navigationController
    }()
    
    lazy var contentView: UIScrollView = {
        let scrollview = UIScrollView(frame: .zero)
        scrollview.isScrollEnabled = true
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    lazy var cardView: CardView = {
        let view = CardView(cornerRadius: 0, shadowRadius: 0, shadowOffset: CGSize(width: 0, height: 0), shadowColor: .clear, shadowOpacity: 0, background: .clear)
       
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerInfo: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    
    
    
    lazy var titleDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nombre: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Nombre"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ciudad: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Ciudad"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tabla: UITableView = {
        let tableview = UITableView(frame: .zero)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.register(ProfileCell.self, forCellReuseIdentifier: "profileCell")
        tableview.tableFooterView = UIView()
        tableview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    lazy var infoperfil: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 80, height: 80)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(profile_cell.self, forCellWithReuseIdentifier: "infoPerfilCell")
        collection.backgroundColor = UIColor.white
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    lazy var imageProfile: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor =  UIColor.black
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    
    public convenience init(navigation: UINavigationController, getuser: String){
        self.init()
        setupUIElements()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        delegate?.notifyOperations()
        delegate?.getPerfilData()
        setupUIElements()
        setupConstraints()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
   
    
    fileprivate func setupUIElements() {
        self.addSubview(contentView)
        contentView.addSubview(cardView)
        cardView.addSubview(containerInfo)
        containerInfo.addSubview(imageProfile)
       
        self.containerInfo.addSubview(nombre)
        self.containerInfo.addSubview(ciudad)
        self.containerInfo.addSubview(infoperfil)
        self.containerInfo.addSubview(tabla)
    }
    
   
    
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            //Contenido
            self.contentView.heightAnchor.constraint(equalToConstant: 120),
            self.contentView.widthAnchor.constraint(equalToConstant: 300),
            self.contentView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            ///CardView
            self.cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.cardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.cardView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.cardView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.cardView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            
            self.containerInfo.topAnchor.constraint(equalTo: self.cardView.topAnchor),
            self.containerInfo.leadingAnchor.constraint(equalTo: self.cardView.leadingAnchor),
            self.containerInfo.trailingAnchor.constraint(equalTo: self.cardView.trailingAnchor),
            self.containerInfo.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            imageProfile.heightAnchor.constraint(equalToConstant: 100),
            imageProfile.widthAnchor.constraint(equalToConstant: 100),
            imageProfile.topAnchor.constraint(equalTo: self.containerInfo.topAnchor, constant: 30),
            imageProfile.leadingAnchor.constraint(equalTo: self.containerInfo.leadingAnchor),
            imageProfile.trailingAnchor.constraint(equalTo: self.containerInfo.trailingAnchor),
           
            
           
            nombre.topAnchor.constraint(equalTo: self.imageProfile.bottomAnchor, constant: 30),
            nombre.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nombre.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            ciudad.topAnchor.constraint(equalTo: self.nombre.bottomAnchor, constant: 10),
            ciudad.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ciudad.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            infoperfil.heightAnchor.constraint(equalToConstant: 100),
            infoperfil.widthAnchor.constraint(equalToConstant: 200),
            infoperfil.topAnchor.constraint(equalTo: self.containerInfo.topAnchor, constant: 250),
            infoperfil.leadingAnchor.constraint(equalTo: self.containerInfo.leadingAnchor),
            infoperfil.trailingAnchor.constraint(equalTo: self.containerInfo.trailingAnchor),
           
            tabla.heightAnchor.constraint(equalToConstant: 300),
            tabla.widthAnchor.constraint(equalToConstant: 200),
            tabla.topAnchor.constraint(equalTo: self.containerInfo.topAnchor, constant: 300),
            tabla.leadingAnchor.constraint(equalTo: self.containerInfo.leadingAnchor),
            tabla.trailingAnchor.constraint(equalTo: self.containerInfo.trailingAnchor),
           


           

        ])
    }
    
}

extension PerfilViewUI: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoData?.profile.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileCell
       
        let imageMain = URL(string: (infoData?.profile[indexPath.row].imagen)!)!
        let imageProfile = URL(string: (infoData?.profile[indexPath.row].imgperfil)!)!
        
        if let imagenPerfil = try? Data(contentsOf: imageProfile) {
            cell.imageProfile.image = UIImage(data: imagenPerfil)
        }
       
            if let imagenPrincipal = try? Data(contentsOf: imageMain) {
               
                cell.imageMain.image = UIImage(data: imagenPrincipal)
            }
        cell.titleDescription.text = infoData?.profile[indexPath.row].titulo
        cell.titlemain.text = infoData?.profile[indexPath.row].descripcion
        return  cell
    }
    
}

extension PerfilViewUI: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return perfilData?.profile.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
              withReuseIdentifier: "infoPerfilCell",
            for: indexPath) as! profile_cell
        
        cell.postsPublicados.text = perfilData?.profile[indexPath.row].items[0]
        cell.followers.text = perfilData?.profile[indexPath.row].items[1]
        cell.following.text = perfilData?.profile[indexPath.row].items[2]
         return cell
    }
    
    
}
