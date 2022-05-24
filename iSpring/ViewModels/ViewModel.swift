//
//  ViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-18.
//

import Foundation
import Firebase
import FirebaseAuth

class viewModel: ObservableObject {
    
    // whenever userList changes, the corresponding view will redraw to update data being displayed
    @Published var userList = [User]()
    
    // create a reference object to auth
    let auth = Auth.auth()
    
    var isSignedIn: Bool {
        // if the current user = nil then there is no user signed in, return not value
        return auth.currentUser != nil
    }
    
    // this function signs in a user with email and password credentials
    func signIn(email: String, password: String) {
        
        // call on the auth function with email and password
        auth.signIn(withEmail: email, password: password) { result, error in
            
            guard result != nil, error == nil else {
                return // there is an error
            }
            
            // Successfully logged in
            
        }
    }
    
    // this function signs up a user
    func signUp(email: String, password: String) {
        
        auth.createUser(withEmail: email, password: password) { result, error in
            
            guard result != nil, error == nil else {
                return // there is an error
            }
            
            // Successfully signed user up
            
        }
        
    }
    
    // this function reads the database
    func getData() {
        
        // set reference to the database
        let db = Firestore.firestore()
        
        // read the documents in the database in a specific path
        db.collection("users").getDocuments { snapshot, error in
            
            // check if errros persist
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    // update the user list in the main thread
                    DispatchQueue.main.async {
                        
                        // get documents and create users
                        self.userList = snapshot.documents.map { d in
                            
                            // transform each document into a user which is returned to the view
                            // note each field in the database is contained in the id variable
                            return User(id: d.documentID,
                                        name: d["name"] as? String ?? "",
                                        userIdentifier: d["user identifier"] as? String ?? "",
                                        dateOfBirth: d["date of birth"] as? String ?? "",
                                        username: d["username"] as? String ?? "",
                                        followers: d["followers"] as? [String] ?? [""],
                                        following: d["following"] as? [String] ?? [""])
                            
                        }
                        
                    }
                    
                }
                
            } else {
                
                
                
            }
            
        }
        
    }
    
    
    
}
