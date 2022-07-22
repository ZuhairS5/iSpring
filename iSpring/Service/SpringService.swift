//
//  SpringService.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-07-20.
//

import Foundation
import Firebase

struct SpringService {
    
    func uploadSpring(content: String, completion: @escaping(Bool) -> Void) {
        
        // user UUID to grab relevant data
        guard let uuid = Auth.auth().currentUser?.uid else { return }
        
        let timestamp = Timestamp(date: Date())
        let data = ["uuid": uuid,
                    "content": content,
                    "replies": 0,
                    "saves": 0,
                    "upvotes": 0,
                    "downvotes": 0,
                    "postExpiry": timestamp,
                    "timestamp": timestamp] as [String : Any]
        
        Firestore.firestore().collection("springs").document() // create a new collection within iSpring that stores the springs
            .setData(data) { error in
                
                if let error = error {
                    completion(false)
                    print("DEBUG: Failed to upload spring.")
                    return
                }
                
                completion(true)
                print("DEBUG: Successfully uploaded new spring.")
                    
                
            }
    }
    
    // used to get all springs (feed view)
    func fetchSprings(completion: @escaping([Spring]) -> Void) {
        
        Firestore.firestore().collection("springs").order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let springs = documents.compactMap({ try? $0.data(as: Spring.self) })
            completion(springs)
//            documents.forEach { document in
//                print(document.data())
//            }
        }
        
    }
    
    // used to get all the springs filtered by a specific user (profile view)
    func fetchSprings(forUUID uuid: String, completion: @escaping([Spring]) -> Void) {
        
        Firestore.firestore().collection("springs").whereField("uuid", isEqualTo: uuid)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let springs = documents.compactMap({ try? $0.data(as: Spring.self) })
            completion(springs.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()} ))

        }
        
    }
    
    func likeSpring(_ spring: Spring, completion: @escaping() -> Void) {
        
        guard let uuid = Auth.auth().currentUser?.uid else { return }
        
        // collection within each user document that records the id's of the posts they liked
        let userLikesRef = Firestore.firestore().collection("users")
            .document(uuid)
            .collection("user-likes")
        
        // the id of the post that was liked
        guard let springID = spring.id else { return }
        
        // retrieve the post based on id
        Firestore.firestore().collection("springs").document(springID)
            .updateData(["upvotes": spring.upvotes + 1]) { _ in
                userLikesRef.document(springID).setData([:]) { _ in
                    completion()
                    print("DEBUG: Spring was liked and now the UI must be updated")
                }
            }
        
    }
    
    func checkIfUserLikedSpring(spring: Spring, completion: @escaping(Bool) -> Void) {
        
        // check user likes collection and see if the post id is in the list
        guard let uuid = Auth.auth().currentUser?.uid else { return }
        guard let springID = spring.id else { return }
        
        Firestore.firestore().collection("users").document(uuid).collection("user-likes").document(springID).getDocument { snapshot, _ in
            guard let snapshot = snapshot else { return }
            completion(snapshot.exists)
        }
        
    }
    
}
