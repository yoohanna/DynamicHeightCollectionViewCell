//
//  Const.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/11/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import Foundation

class Config {
    
    static let sharedInstance = Config()
    private init() {}
    
    var baseURL: String {
        return "http://app.akharinkhabar.ir/"
    }
    
    var postURL: String {
        return baseURL + "TestFlight.aspx?code=9&index="
    }
    
    var Text_XML:String{
        return "text/xml; charset=utf-8"
    }

    
    
}
