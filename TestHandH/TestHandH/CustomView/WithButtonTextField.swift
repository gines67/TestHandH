//
//  WithButtonTextField.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 15.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class WithButtonTextField: UnderLineTextField {

    fileprivate func createButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: CGFloat(frame.size.width - 25), y: 0, width: 113, height: 30)
        button.setTitleColor(grayTextColor, for: .normal)
        button.setTitle("Забыли пароль?", for: .normal)
        button.titleLabel?.font = UIFont(name: (button.titleLabel?.font.fontName)!, size: 12)
        button.layer.borderColor = grayColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        return button
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let button = createButton()
        rightView = button
        rightViewMode = .always
    }
    
}
