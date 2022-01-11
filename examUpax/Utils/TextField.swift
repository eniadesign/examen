//
//  TextField.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 08/01/22.
//

import UIKit

class TextField: UITextField {
    private var __maxLengths = [UITextField: Int]()
    var __backgroundColor : UIColor?{
        didSet{
            backgroundColor = __backgroundColor
        }
    }
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // Max
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(maxLengthValidator), for: .editingChanged)
        }
    }
    
    public convenience init(
        maxLength: Int
    ) {
        self.init()
        self.maxLength = maxLength
        layer.cornerRadius = 10
        returnKeyType = .done
        textColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func maxLengthValidator(textField: UITextField) {
        if let t = textField.text {
            textField.text = String(t.prefix(maxLength))
        }
    }
}

