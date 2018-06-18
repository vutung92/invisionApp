//
//  UserDefaults.swift
//  InvisionApp
//
//  Created by Thanh Tung Vu on 6/18/18.
//  Copyright © 2018 Tung Vu. All rights reserved.
//

import Foundation

let TOKEN = "token"
extension UserDefaults {
    
    func getToken() -> String{
        guard self.object(forKey: TOKEN) != nil else {
            return ""
        }
        return self.object(forKey: TOKEN) as! String
    }
}
