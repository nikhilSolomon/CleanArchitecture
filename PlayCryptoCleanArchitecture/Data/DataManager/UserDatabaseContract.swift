//
//  UserDatabaseContract.swift
//  PlayCryptoCleanArchitecture
//
//  Created by nikhil-pt6881 on 15/03/23.
//

import Foundation


protocol UserDatabaseContract {
    func authenticateUser (credentials : (name : String,password : String),
                           success : (User) -> Void ,
                           failure : (String) -> Void)
    
    func updateUserData (name : String , password :
                         String, phonenumber : String ,
                         success : (Bool) -> Void ,
                         failure : (String) -> Void)
}
