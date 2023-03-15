//
//  UserHandlerContract.swift
//  PlayCryptoCleanArchitecture
//
//  Created by nikhil-pt6881 on 15/03/23.
//

import Foundation


protocol UserHandlerContract {
    func login (credentials : (name : String , password : String),
                success : @escaping (User) -> Void ,
                failure : @escaping (String) -> Void)
    
    
    func signup (name : String ,
                 password : String ,
                 phonenumber : String ,
                 success : @escaping (Bool) -> Void ,
                 failure : @escaping (String) -> Void)
}

