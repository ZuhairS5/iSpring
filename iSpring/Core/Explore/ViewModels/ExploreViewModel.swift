//
//  ExploreViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-07-20.
//

import Foundation

class ExploreViewModel : ObservableObject {
    
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User] {
        
        if searchText.isEmpty {
            return users
        } else {
            
            let lowerCasedQuery = searchText.lowercased()
            return users.filter({            
                $0.username.lowercased().contains(lowerCasedQuery) || $0.fullName.lowercased().contains(lowerCasedQuery)
            })
            
        }
        
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        
        service.fetchUsers { users in
            self.users = users
//            print("DEBUG: Users are \(users)")
        }
    }
    
}
