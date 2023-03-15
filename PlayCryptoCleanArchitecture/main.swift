//
//  main.swift
//  PlayCryptoCleanArchitecture
//
//  Created by nikhil-pt6881 on 15/03/23.
//

import Foundation

print("Started")

UserDataBaseService().setup()
let dataBase = UserDataBaseService()
let dataManger = UserDataManager(database: dataBase)
let user = userHandler(datamanager: dataManger)

//user.signupUser(name: "nikhil", password: "123", phonenumber: "12222")
user.loginUser(userCredentials: ("nikasd","asdf"))
