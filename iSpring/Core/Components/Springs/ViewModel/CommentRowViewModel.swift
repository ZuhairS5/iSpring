//
//  CommentRowViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-08-11.
//

import Foundation

// each instance of the comment should populate the comment, author and timestamp of comment
class CommentRowViewModel: ObservableObject {
    
    private let service = SpringService()
    @Published var comment: Comment
    private let userService = UserService()
    
    init(comment: Comment) {
        
        self.comment = comment
        
    }
    
    // get the User, as an object, of the comment's author
    func fetchUser(_ uuid: String) {
        
        userService.fetchUser(withUUID: uuid) { user in
            self.comment.user = user
        }
        
    }
    
//    func comment(comment: String) {
//
//        service.uploadComment(spring: spring, comment: comment) {
//            // do something with completion - dismiss the text pane
//        }
//
//    }
        
}
