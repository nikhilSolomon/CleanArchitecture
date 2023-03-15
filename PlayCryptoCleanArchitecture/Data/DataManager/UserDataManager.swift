//
//  UserDataManager.swift
//  PlayCryptoCleanArchitecture
//
//  Created by nikhil-pt6881 on 15/03/23.
//

import Foundation

class UserDataManager {
    
    var database : UserDatabaseContract
    
    init(database: UserDatabaseContract) {
        self.database = database
    }
}


extension UserDataManager : UserHandlerContract {
    
    
    func login(credentials: (name: String, password: String), success: @escaping (User) -> Void, failure: @escaping (String) -> Void) {
        
        database.authenticateUser(credentials: credentials, success: { (currentUser) in
            //print("DM",currentUser)
            success(currentUser)
        }, failure: { (responseFromDb) in
           // print(responseFromDb)
            failure(responseFromDb)
        })
    }
    
    func signup(name: String, password: String, phonenumber: String, success: @escaping (Bool) -> Void, failure: @escaping (String) -> Void) {
        
        database.updateUserData(name: name, password: password, phonenumber: phonenumber,  success: { (status) in
            //print("DM",status)
            success(status)
        }, failure: { (responseFromDb) in
            //print(responseFromDb)
            failure(responseFromDb)
        })
        
    }
    
}
