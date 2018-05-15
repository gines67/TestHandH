//
//  OrangeRoundedButton.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 15.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit

class OrangeRoundedButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        clipsToBounds = true
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 0.5 * bounds.size.height
        layer.backgroundColor = orangeColor.cgColor
    }
}
