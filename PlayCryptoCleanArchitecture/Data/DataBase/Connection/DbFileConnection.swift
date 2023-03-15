//
//  DbFileConnection.swift
//  PlayCryptoCleanArchitecture
//
//  Created by nikhil-pt6881 on 15/03/23.
//


import Foundation

class DbConnection{
    
    static var sharedconnectionObject = DbConnection()
    
    private init() {}
    
    static func establishConnection() -> URL{
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask , appropriateFor: nil , create: false ).appendingPathComponent("asd.db")
            
        }catch{
            print("Error creating DB")
            return URL(fileURLWithPath:"")
        }
    }
}
