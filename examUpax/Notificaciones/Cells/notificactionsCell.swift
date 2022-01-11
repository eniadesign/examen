//
//  profileCell.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//

import UIKit

class notificationsCell: UITableViewCell {
    
    
    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var overLine: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    lazy var imageMain: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.tintColor =  UIColor.black
        
        return imageView
    }()
    
   
    
    lazy var imageLike: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor =  UIColor.black
        imageView.image =  UIImage(named: "like")
        return imageView
    }()
    
    lazy var imagemessage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor =  UIColor.black
        imageView.image =  UIImage(named: "message")
        return imageView
    }()
    
    lazy var imageProfile: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor =  UIColor.black
        return imageView
    }()
    
    lazy var titleDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 1
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var titlemain: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 1
        label.textColor = UIColor.black
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setupUIElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUIElements() {
        contentView.addSubview(containerView)
        containerView.addSubview(overLine)
        
        containerView.addSubview(titleDescription)
        containerView.addSubview(titlemain)
        containerView.addSubview(imageProfile)
       
       
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            overLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overLine.topAnchor.constraint(equalTo: contentView.bottomAnchor),
            overLine.heightAnchor.constraint(equalToConstant: 1),
            
           
            imageProfile.heightAnchor.constraint(equalToConstant: 30),
            imageProfile.widthAnchor.constraint(equalToConstant: 30),
            imageProfile.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            imageProfile.trailingAnchor.constraint(equalTo: titleDescription.leadingAnchor, constant: -3),
            
            titleDescription.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            titleDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            titleDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            
            titlemain.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 5),
            titlemain.leadingAnchor.constraint(equalTo: titleDescription.leadingAnchor, constant: 20),
            titlemain.trailingAnchor.constraint(equalTo: titleDescription.trailingAnchor, constant: -10),
            titlemain.bottomAnchor.constraint(equalTo: overLine.bottomAnchor, constant: -10),
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

