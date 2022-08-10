//
//  SpringModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-07-20.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Spring: Identifiable, Decodable {
    @DocumentID var id: String?
    let content: String
    var downvotes: Int
    var postExpiry: Date
    var replies: Int
    var saves: Int
    let timestamp: Timestamp
    var upvotes: Int
    let uuid: String
    
    // these properties are not declared in the database
    // cannot be initialized with a value without optional declaration and therefore
    // must be defined by their respective data types
    var user: User?
    var didUpvote: Bool? = false
    var didDownvote: Bool? = false
    
}
