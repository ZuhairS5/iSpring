//
//  UserModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-09.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let fullName: String
    let email: String
    let username: String
    let profileImageURL: String
    
}
