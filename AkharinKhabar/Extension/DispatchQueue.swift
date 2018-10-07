//
//  DispatchQueue.swift
//  AkharinKhabar
//
//  Created by Nima Davarpanah on 7/12/1397 AP.
//  Copyright © 1397 Mohammad Davarpanah. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
    
}
