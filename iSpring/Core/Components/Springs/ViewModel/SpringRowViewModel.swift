//
//  SpringRowViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-07-21.
//

import Foundation

class SpringRowViewModel: ObservableObject {
    
    private let service = SpringService()
    @Published var spring: Spring
    
    init(spring: Spring) {
        self.spring = spring
        checkIfUserUpvotedSpring()
        checkIfUserDownvotedSpring()
    }
    
    func upvoteSpring() {
        if !(spring.didUpvote ?? false) && !(spring.didDownvote ?? false) {
            
            service.upvoteSpring(spring, isUpvoted: spring.didUpvote ?? false) {
                self.spring.didUpvote?.toggle()
            }
            
        }
    }
    
    func downvoteSpring() {
        
        if !(spring.didDownvote ?? false) && !(spring.didUpvote ?? false) {
            
            service.downvoteSpring(spring, isDownvoted: spring.didDownvote ?? false) {
                self.spring.didDownvote?.toggle()
            }
            
        }
        
    }
    
    func checkIfUserUpvotedSpring() {
        service.checkIfUserUpvotedSpring(spring: spring) { didUpvote in
            self.spring.didUpvote = didUpvote
        }
    }
    
    func checkIfUserDownvotedSpring() {
        
        service.checkIfUserDownvotedSpring(spring: spring) { didDownvote in
            self.spring.didDownvote = didDownvote
        }
        
    }
    
    func saveSpring() { service.saveSpring(spring: spring) {} }
    
}
