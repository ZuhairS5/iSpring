//
//  AuthViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-07.
//

import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    // if the user is not logged in, value is nil, else it has a value that stores the user session in userSession
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User? // is optional because the api needs to be reached before we set the user model
                                      // Note User is a User Model defined by us NOT firebase
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        // initialize the user session
//        self.userSession = Auth.auth().currentUser
        self.userSession = nil
        self.fetchUser()
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login client with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(email: String, password: String, fullName: String, username: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register client with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempUserSession = user
            self.userSession = user // set to user if the user is successfully returned
            
            // keys in "", data being set from register function
            let newUserData = ["email": email,
                               "fullName": fullName,
                               "username": username]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(newUserData) { _ in
                    self.didAuthenticateUser = true
                }
            
        }
        
    }
    
    func logout() {
        
        // update view model to update front end
        userSession = nil
        // log the user out in backend
        try? Auth.auth().signOut()
        didAuthenticateUser = false
        
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uuid = tempUserSession?.uid else { return }

        ImageUploader.uploadImage(image: image) { profileImageURL in
            Firestore.firestore().collection("users")
                .document(uuid)
                .updateData(["profileImageURL": profileImageURL]) { _ in
                    self.userSession = self.tempUserSession
                }

        }
    }
    
    func fetchUser() {
        guard let uuid = self.userSession?.uid else { return }
        service.fetchUser(withUUID: uuid) { user in
            self.currentUser = user
        }
    }
    
}
