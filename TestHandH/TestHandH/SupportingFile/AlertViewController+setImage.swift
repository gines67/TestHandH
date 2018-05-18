//
//  AlertViewWithImage.swift
//  TestHandH
//
//  Created by Сергей Герасимов on 18.05.2018.
//  Copyright © 2018 Сергей Герасимов. All rights reserved.
//

import UIKit
import AsyncImageCachedFramework

extension UIAlertController {
    
    func setImage(withImageUrl url: String)  {
        setImage(withImageUrl: URL(fileURLWithPath: url))
    }
    
    func setImage(withImageUrl url: URL)  {
        let imageView = UIImageView(frame: CGRect(x:self.view.frame.width/2 - 20, y:10, width:40, height:40))
        imageView.image = UIImage(named: "empty")
        imageView.downloadImage(withUrl: url)
        self.view.addSubview(imageView)
    }
}
