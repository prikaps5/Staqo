//
//  SongDetails.swift
//  StaqoDemo
//
//  Created by Priyanka Kapasiya on 07/12/20.
//  
//

import Foundation


struct UserDetails {
    var email      : String?
    var first_name       : String?
    var last_name     : String?
    var avatar         : String?
    var fullName = ""
    
    init(with Data : JSONDict) {
        self.email    = Data["email"] as? String ?? ""
        self.first_name     = Data["first_name"] as? String ?? ""
        self.last_name   = Data["last_name"] as? String ?? ""
        self.avatar       = Data["avatar"] as? String ?? ""
        let n = Data["fullName"] as? String ?? ""
        if n == "" {
        self.fullName = (Data["first_name"] as? String ?? "") + " "  + (Data["last_name"] as? String ?? "")
        } else {
            self.fullName = Data["fullName"] as? String ?? ""
        }
        
        
    }
}

