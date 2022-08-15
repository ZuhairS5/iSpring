//
//  UserModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-09.
//

import Foundation
import FirebaseFirestoreSwift


// this model creates a user object data model
struct User: Identifiable, Decodable {
    
    // information won't be retrieved if the decode fails
    @DocumentID var id: String? // the uuid of the user
    let email: String
    let fullName: String
    let profileImageURL: String
    let username: String
    
}
