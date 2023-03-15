//
//  UserHandler.swift
//  PlayCryptoCleanArchitecture
//
//  Created by nikhil-pt6881 on 15/03/23.
//

import Foundation

class userHandler {
    
    
    var datamanager : UserHandlerContract
    
    init(datamanager: UserHandlerContract) {
        self.datamanager = datamanager
    }
     // havent used completion handlers as no layer above it
    public func loginUser(userCredentials : (String,String)){
        datamanager.login(credentials: userCredentials , success: { (currentUser) in
            print("Logged in as",currentUser.name)
        }, failure: { (ErrorStatus) in
            print(ErrorStatus)
        })
    }
    
    
    public func signupUser(name : String,password : String , phonenumber : String){
        datamanager.signup(name: name, password: password, phonenumber: phonenumber,
                           success: { (booleanResponseStatus) in
            print("Userdata inserted sueccess fully",booleanResponseStatus)
        }, failure: { (response) in
            print(response)
        })
        
    }
    
    
}
