//
//  Preloader.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/15/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class Preloader: UIViewController, NVActivityIndicatorViewable{
    static let sharedInstance = Preloader()
    public func startLoading(){
        let size = CGSize(width: 30, height: 30)
        
        startAnimating(size, message: "Loading...", type: NVActivityIndicatorType(rawValue: 26)!)
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating...")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating()
        }
        
    }
    
    
}
