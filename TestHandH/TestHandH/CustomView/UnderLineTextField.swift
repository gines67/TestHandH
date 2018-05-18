//
//  UnderLineTextField.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 15.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit


class UnderLineTextField: UITextField {

    var bottomLine = CALayer()
    
    override func draw(_ rect: CGRect) {
        
        bottomLine.frame = CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1)
        bottomLine.backgroundColor = grayColor.cgColor
        borderStyle = UITextBorderStyle.none
        layer.addSublayer(bottomLine)
    }
}
