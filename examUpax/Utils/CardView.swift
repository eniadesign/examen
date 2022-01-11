//
//  CardView.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 09/01/22.
//

import UIKit
open class CardView: UIView {
    
    public convenience init(
        cornerRadius: Int = 30,
        shadowRadius: Int = 7,
        shadowOffset: CGSize = CGSize(width: 0, height: 2),
        shadowColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1221039245),
        shadowOpacity: Int = 1,
        background: UIColor
    ) {
        self.init()
        layer.cornerRadius = CGFloat(cornerRadius)
        layer.shadowRadius = CGFloat(shadowRadius)
        layer.shadowOffset = shadowOffset
        layer.shadowColor = shadowColor.cgColor
        layer.backgroundColor = background.cgColor
        layer.shadowOpacity = Float(shadowOpacity)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
