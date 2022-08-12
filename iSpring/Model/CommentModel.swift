//
//  CommentModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-08-11.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let author: String
    let timestamp: Timestamp
    let comment: String
    
    var user: User?
    
}
