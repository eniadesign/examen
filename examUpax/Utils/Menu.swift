//
//  Menu.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 09/01/22.
//

import UIKit
import DropDown

class Menu: UIView {
    
    let dropDown = DropDown()
    
    public func desplegable(){
        dropDown.dataSource = ["Categoría Uno", "Categoría Dos", "Categoría Tres"]
        dropDown.dismissMode = .automatic
        dropDown.selectRow(at: 0)
        dropDown.direction = .any
        DropDown.startListeningToKeyboard()
        dropDown.hide()
        dropDown.width = 200
//        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//            buttonshow.setTitle(item, for: .normal)
//        }
        dropDown.topOffset = CGPoint(x: 10, y:20)
        dropDown.bottomOffset = CGPoint(x: 0, y:68)
    }
    
}

