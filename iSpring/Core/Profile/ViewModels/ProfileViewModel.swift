//
//  ProfileViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-07-20.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var springs = [Spring]()
    private let service = SpringService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserTweets()
        
    }
    
    func fetchUserTweets() {
        guard let uuid = user.id else { return }
        service.fetchSprings(forUUID: uuid) { springs in
            self.springs = springs
            for i in 0 ..< springs.count {
                self.springs[i].user = self.user
            }
        }
        
    }
    
}
