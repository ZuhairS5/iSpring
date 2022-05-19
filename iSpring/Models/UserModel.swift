//
//  UsersModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-18.
//

import Foundation

struct User: Identifiable {
    
    // document id of user (in order to conform to Identifiable protocol, the variable must be called "id")
    var id: String
    
    // mimic the data structure created in the database
    var name: String
    var userIdentifier: String
    var dateOfBirth: String
    var username: String
    var followers: [String]
    var following: [String]
    
}
