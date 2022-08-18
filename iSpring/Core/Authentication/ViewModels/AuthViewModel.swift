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
//        self.userSession = nil
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User Session is \(self.userSession?.uid)")
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
            self.fetchUser()
            print("DEBUG: Successfully logged in the user \(self.userSession?.uid)")
        }
    }
    
    func register(email: String, password: String, fullName: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Failed to register client with error because: \n    \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user // this prevents app from redirecting user to mainInterface when state variable updates
//            self.userSession = user // setting the userSession to early causes the state variable to update the views from ContentView
            
            // keys in "", data being set from register function
            let newUserData = ["email": email,
                               "fullName": fullName,
                               "username": username.lowercased(),
                               "uuid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(newUserData) { _ in
                    print("DEBUG: Uploaded new user's data, user is: \(self.tempUserSession?.uid)")
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
        print("DEBUG: Logged the user out")
        
    }
    
    func uploadProfileImage(_ image: UIImage) {
        
        guard let uuid = tempUserSession?.uid else { return }

        ImageUploader.uploadImage(image: image) { profileImageURL in
            Firestore.firestore().collection("users")
                .document(uuid)
                .updateData(["profileImageURL": profileImageURL]) { _ in
                    self.userSession = self.tempUserSession // updating the userSession pings all reliant objects to refresh the views
                    self.fetchUser() // override the new user from previous user details
                }

        }
    }
    
    func fetchUser() {
        guard let uuid = self.userSession?.uid else { return }
        service.fetchUser(withUUID: uuid) { user in
            // set the current user to the user fetched from the database
            self.currentUser = user
        }
    }
    
}
