//
//  UIViewController.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/15/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import UIKit

extension UIViewController{
    func insertRightNavbarItems(title:String, icon:String){
        var iconImageView:UIImageView!
        var shopNameLabel:UILabel!
        if let navigationBar = self.navigationController?.navigationBar {
            let iconFrame = CGRect(x: navigationBar.frame.width-60, y: navigationBar.frame.height/2-18, width: 55, height: 36)
            let shopNameFrame = CGRect(x: iconFrame.minX - 100, y: 0, width: 100, height: navigationBar.frame.height)
            
            iconImageView = UIImageView(frame: iconFrame)
            iconImageView.image = UIImage(named: icon)?.withRenderingMode(.alwaysTemplate)
            iconImageView.tintColor = .white
            iconImageView.contentMode = .center
            
            shopNameLabel = UILabel(frame: shopNameFrame)
            shopNameLabel.text = title
            shopNameLabel.textColor = .white
            shopNameLabel.font = UIFont.mySystemFont(ofSize: 16)
            shopNameLabel.textAlignment = .right
            
            navigationBar.addSubview(iconImageView)
            navigationBar.addSubview(shopNameLabel)
        }
    }
    
    func insertLeftNavbarItems(items: UIImage...) {
        var barButtonItems:[UIBarButtonItem] = []
        for item in items{
            barButtonItems.append(UIBarButtonItem(image: item, style: .plain, target: self, action: nil))
        }
        self.navigationItem.setLeftBarButtonItems(barButtonItems, animated: true)
    }
}
