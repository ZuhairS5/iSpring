//
//  iSpringApp.swift
//  iSpring
//
//  Created by Zuhair Shaikh on 2022-05-16.
//

import SwiftUI
import Firebase

@main
struct iSpringApp: App {
    
    // initialize the first instance of viewModel
    @StateObject var viewModel = AuthViewModel()
    
    
    // required to connect to Firebase
    init() {
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView() // this is the "root" view of the app itself
            }
            .environmentObject(viewModel) // supplies an initialized copy of viewModel to content view
        }
    }
    
}


