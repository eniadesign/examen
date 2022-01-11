//
//  MessageViewUI.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 10/01/22.
//


import UIKit
import Charts
import BusinessChat


class TablaViewUI: UIView{
    
    weak var delegate: TablaViewDelegate?
    var user: String?
   
   
    
    lazy var pieChart: PieChartView = {
        let grafica = PieChartView(frame: .zero)
        grafica.translatesAutoresizingMaskIntoConstraints = false
        return grafica
    }()
    
    lazy var pieChart2: PieChartView = {
        let grafica = PieChartView(frame: .zero)
        grafica.backgroundColor = UIColor.cyan
        grafica.translatesAutoresizingMaskIntoConstraints = false
        return grafica
    }()
    
    lazy var navigationBar: ComponentNavbarHome = {
        let navigationController = ComponentNavbarHome(frame: .zero)
        navigationController.backButton.isHidden = true
        navigationController.titleSection.text = "Resultados"
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
    
    lazy var cardView: CardView = {
        let view = CardView(cornerRadius: 0, shadowRadius: 0, shadowOffset: CGSize(width: 0, height: 0), shadowColor: .clear, shadowOpacity: 0, background: .clear)
       
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerInfo: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cyan
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.addSubview(navigationBar)
        self.addSubview(contentView)
        self.contentView.addSubview(containerInfo)
        containerInfo.addSubview(pieChart)
        containerInfo.addSubview(pieChart2)
    }
    
   
    
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.navigationBar.topAnchor.constraint(equalTo: self.topAnchor),
            self.navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
           
            self.contentView.topAnchor.constraint(equalTo: self.navigationBar.bottomAnchor, constant: 0),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.contentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
           
            
            self.containerInfo.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            self.containerInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.containerInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.containerInfo.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            pieChart2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pieChart2.heightAnchor.constraint(equalToConstant: 350),
           pieChart2.widthAnchor.constraint(equalToConstant: 300),
            pieChart2.topAnchor.constraint(equalTo: self.containerInfo.topAnchor, constant: 0),
            pieChart2.leadingAnchor.constraint(equalTo: self.containerInfo.leadingAnchor, constant: 0),
            pieChart2.trailingAnchor.constraint(equalTo: self.containerInfo.trailingAnchor, constant: 0),
           
            pieChart.heightAnchor.constraint(equalToConstant: 350),
           pieChart.widthAnchor.constraint(equalToConstant: 200),
            pieChart.topAnchor.constraint(equalTo: self.pieChart2.bottomAnchor, constant: 60),
            pieChart.leadingAnchor.constraint(equalTo: self.containerInfo.leadingAnchor, constant: 0),
            pieChart.trailingAnchor.constraint(equalTo: self.containerInfo.trailingAnchor, constant: 0),
           
        ])
    }
    
}





