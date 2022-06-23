//
//  UserService.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-09.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    // this function allows the app to read the data from AuthViewModel, and then populate the fields needed by the UserModel
    func fetchUser(withUUID uuid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uuid)
            .getDocument { snapshot, _ in // snapshot is an unreadable object in the database
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
                print("DEBUGGER::")
                print(user.username)
                print(user.fullName)
                print(user.profileImageURL)
                
            }
    }
    
}
