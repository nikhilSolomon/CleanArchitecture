//
//  Dbhandlers.swift
//  PlayCryptoCleanArchitecture
//
//  Created by nikhil-pt6881 on 15/03/23.
//


import Foundation
import SQLite3

enum SqlInsertStatements : String {
    case UserDetails = "INSERT INTO CryptoUsers (userid , name, phonenumber,password,wallet) VALUES (?,?,?,?,?)"
}
enum SqlSelectStatements : String {
    case User = "SELECT * FROM CryptoUsers WHERE name = ? AND password = ?"
}



class UserDataBaseService : UserDatabaseContract {
    
     static var connectionPointer : OpaquePointer?
     
     func setup(){
         if sqlite3_open(DbConnection.establishConnection().path, &UserDataBaseService.connectionPointer) != SQLITE_OK {
             print("error opening database")
         }
     }
    
    
    func authenticateUser(credentials: (name : String,password : String), success: (User) -> Void, failure: (String) -> Void) {
        var queuryPointer : OpaquePointer?
        
        let selectStatement : String = SqlSelectStatements.User.rawValue
        defer{
            sqlite3_finalize(queuryPointer)
        }
        if sqlite3_prepare_v2(UserDataBaseService.connectionPointer,selectStatement,-1,&queuryPointer,nil) == SQLITE_OK {
            
            sqlite3_bind_text(queuryPointer,1,NSString(string:credentials.name).utf8String,-1,nil)
            sqlite3_bind_text(queuryPointer,2,NSString(string:credentials.password).utf8String,-1,nil)
            if sqlite3_step(queuryPointer) == SQLITE_ROW{
                // db reponse to object
                success(User(id:String(cString: sqlite3_column_text(queuryPointer, 0)) ,name: String(cString: sqlite3_column_text(queuryPointer, 1)), phonenumber: String(cString: sqlite3_column_text(queuryPointer, 2)), password: String(cString: sqlite3_column_text(queuryPointer, 3)), wallet: Int(sqlite3_column_int(queuryPointer, 4))))
            } else {
                failure("Check credentials1")
            }
            
        }else
        {
            failure("Check credentials2")
        }
    }
    
    // Temp id genrator
    func userIdGenerator() -> String{
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let userIdLength = 10

        var userId = ""

        for _ in 0..<userIdLength {
            let randomIndex = Int.random(in: 0..<letters.count)
            let randomLetter = letters[letters.index(letters.startIndex, offsetBy: randomIndex)]
            userId += String(randomLetter)
        }

        return userId
        
    }
                        
    
    func updateUserData(name: String, password: String, phonenumber: String, success: (Bool) -> Void, failure: (String) -> Void) {
        var insertPointer: OpaquePointer?
        let insertStatement : String = SqlInsertStatements.UserDetails.rawValue
        
        if sqlite3_prepare_v2(UserDataBaseService.connectionPointer,insertStatement,-1,&insertPointer,nil) == SQLITE_OK {
            sqlite3_bind_text(insertPointer, 1,  NSString(string:userIdGenerator()).utf8String, -1, nil)
            sqlite3_bind_text(insertPointer, 2,  NSString(string:name).utf8String, -1, nil)
            sqlite3_bind_text(insertPointer, 3, NSString(string:phonenumber).utf8String, -1, nil)
            sqlite3_bind_text(insertPointer, 4, NSString(string:password).utf8String, -1, nil)
            sqlite3_bind_int(insertPointer, 5, Int32(1000))
            if sqlite3_step(insertPointer) == SQLITE_DONE {
                success(true)
            } else {
                failure("Could not insert row.")
            }
            
            
            sqlite3_finalize(insertPointer)
        } else {
            failure("\nINSERT statement is not prepared.1")
        }
        sqlite3_close(insertPointer)
    }
    
    

}

