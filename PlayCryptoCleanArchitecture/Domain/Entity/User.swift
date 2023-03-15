//
//  User.swift
//  PlayCryptoCleanArchitecture
//
//  Created by nikhil-pt6881 on 15/03/23.
//

import Foundation

struct User {
    let id : String
    let name : String
    let phonenumber : String
    let password : String
    var wallet : Int
    
    init(id: String, name: String, phonenumber: String, password: String, wallet: Int) {
        self.id = id
        self.name = name
        self.phonenumber = phonenumber
        self.password = password
        self.wallet = wallet
    }
    
}
