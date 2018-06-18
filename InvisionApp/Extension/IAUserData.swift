//
//  IAUserData.swift
//  InvisionApp
//
//  Created by Thanh Tung Vu on 6/18/18.
//  Copyright © 2018 Tung Vu. All rights reserved.
//

import Foundation
import ObjectMapper

class IAUserData: Mappable
{
    var id: Int?
    var username: String?
    var first_name: String?
    var last_name: String?
    var student_number: String?
    var library_number: String?
    var bar_code: String?
    var level: String?
    var card_code: String?
    var start_date: String?
    var expiry_date: String?
    var course: String?
    var department: String?
    var photo: String?
    var status: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        student_number <- map["student_number"]
        library_number <- map["library_number"]
        bar_code <- map["bar_code"]
        level <- map["level"]
        card_code <- map["card_code"]
        start_date <-  map["start_date"]
        expiry_date <- map["expiry_date"]
        course <- map["course"]
        department <- map["department"]
        photo <- map["photo"]
        status <- map["status"]
    }
    
   
}

class IAUser: Mappable {
    var user: IAUserData?
    var token: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        user <- map["user"]
        token <- map["token"]
    }
}
