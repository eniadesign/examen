//
//  Info_cell.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 09/01/22.
//

import UIKit

class profile_cell: UICollectionViewCell {
    
    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var containerFriends: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var overLine: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
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
        label.numberOfLines = 0
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var nombre: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var ciudad: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var followers: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var following: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var postsPublicados: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var titlemain: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 3
        label.textColor = UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        setupUIElements()
        setupConstraints()
        self.backgroundColor = UIColor.clear        }
     
        required init?(coder: NSCoder) {
            super.init(coder: coder)
         
            self.isUserInteractionEnabled = true
            setupUIElements()
            setupConstraints()
        }
    
  
   
    
    fileprivate func setupUIElements() {
       
        self.addSubview(postsPublicados)
        self.addSubview(followers)
        self.addSubview(following)
       
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            postsPublicados.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            postsPublicados.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 40),
            postsPublicados.widthAnchor.constraint(equalToConstant: 40),
           
            followers.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            followers.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 150),
            followers.widthAnchor.constraint(equalToConstant: 60),
           
            following.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            following.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 250),
            following.widthAnchor.constraint(equalToConstant: 60),
          
           
          
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

  
}
