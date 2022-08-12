//
//  CommentFeedViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-08-12.
//

import Foundation

class CommentFeedViewModel: ObservableObject {
    
    @Published var spring: Spring
    @Published var comments = [Comment]()
    let service = SpringService()
    let userService = UserService()
    
    init(spring: Spring) {
        
        // get the spring that has comments
        self.spring = spring
        // fetch the comments
        fetchComments()
        
    }
    
    // given the spring get the comments from Firebase
    func fetchComments() {
        
        service.fetchComments(spring: spring) { comments in
            self.comments = comments
            
            for i in 0 ..< comments.count {
                
                let uuid = comments[i].author
                self.userService.fetchUser(withUUID: uuid) { user in
                    self.comments[i].user = user
                }
                
            }
            
        }
        
    }
}
