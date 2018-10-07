//
//  UILabel.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/12/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import UIKit

extension UILabel{
    func configure(size: CGFloat, color: UIColor){
        self.textAlignment = .right
        self.font = UIFont.mySystemFont(ofSize: size)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.textColor = color
    }
}
