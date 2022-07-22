//
//  FeedViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-07-20.
//

import Foundation

class SpringFeedViewModel: ObservableObject {
    @Published var springs = [Spring]()
    let service = SpringService()
    let userService = UserService()
    
    init() {
        
        fetchSprings()
        
    }
    
    func fetchSprings() {
        
        service.fetchSprings { springs in
            self.springs = springs
            
            for i in 0 ..< springs.count {
                let uuid = springs[i].uuid
                self.userService.fetchUser(withUUID: uuid) { user in
                    self.springs[i].user = user
                }
                
            }
            
        }
    }
    
}
