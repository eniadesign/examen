//
//  MessageViewUI.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//


import UIKit


class MessageViewUI: UIView{
    
    weak var delegate: MessageViewDelegate?
    var user: String?
   
    var infoData: MessageEntity?{
        didSet{
            tabla.reloadData()
        }
    }
    
    
    lazy var navigationBar: ComponentNavbarHome = {
        let navigationController = ComponentNavbarHome(frame: .zero)
        navigationController.backButton.isHidden = true
        navigationController.titleSection.text = "Inbox"
        navigationController.translatesAutoresizingMaskIntoConstraints = false
        return navigationController
    }()
    
    lazy var contentView: UIScrollView = {
        let scrollview = UIScrollView(frame: .zero)
        
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
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    
   
    
    lazy var tabla: UITableView = {
        let tableview = UITableView(frame: .zero)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.register(MessagesCell.self, forCellReuseIdentifier: "messageCell")
        tableview.tableFooterView = UIView()
        tableview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
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
        
        tabla.reloadData()
        setupUIElements()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    
    fileprivate func setupUIElements() {
        self.addSubview(navigationBar)
        self.addSubview(contentView)
        contentView.addSubview(cardView)
        cardView.addSubview(containerInfo)
        containerInfo.addSubview(imageProfile)
        self.containerInfo.addSubview(tabla)
        self.containerInfo.addSubview(title)
        
    }
    
   
    
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.navigationBar.topAnchor.constraint(equalTo: self.topAnchor),
            self.navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.contentView.heightAnchor.constraint(equalToConstant: 120),
            self.contentView.widthAnchor.constraint(equalToConstant: 300),
            self.contentView.topAnchor.constraint(equalTo: self.navigationBar.topAnchor, constant: 80),
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
           
            tabla.heightAnchor.constraint(equalToConstant: 700),
            tabla.widthAnchor.constraint(equalToConstant: 200),
            tabla.topAnchor.constraint(equalTo: self.containerInfo.topAnchor, constant: 0),
            tabla.leadingAnchor.constraint(equalTo: self.containerInfo.leadingAnchor),
            tabla.trailingAnchor.constraint(equalTo: self.containerInfo.trailingAnchor),
           
        ])
    }
    
}

extension MessageViewUI: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return infoData?.messages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessagesCell
       
        let imageMain = URL(string: (infoData?.messages[indexPath.row].imagen)!)!
        let imageProfile = URL(string: (infoData?.messages[indexPath.row].imgperfil)!)!
        
        if let imagenPerfil = try? Data(contentsOf: imageProfile) {
            cell.imageProfile.image = UIImage(data: imagenPerfil)
        }
       
            if let imagenPrincipal = try? Data(contentsOf: imageMain) {
               
                cell.imageMain.image = UIImage(data: imagenPrincipal)
            }
        cell.titleDescription.text = infoData?.messages[indexPath.row].titulo
        cell.titlemain.text = infoData?.messages[indexPath.row].descripcion
        return  cell
    }
    
}


