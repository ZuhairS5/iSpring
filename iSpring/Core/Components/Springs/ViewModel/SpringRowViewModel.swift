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
        service.upvoteSpring(spring, isUpvoted: spring.didUpvote ?? false) {
            self.spring.didUpvote?.toggle()
        }
    }
    
    func downvoteSpring() {
        
        service.downvote(spring, isDownvoted: spring.didDownvote ?? false) {
            self.spring.didDownvote?.toggle()
        }
        
    }
    
    func checkIfUserUpvotedSpring() {
        service.checkIfUserUpvotedSpring(spring: spring) { didUpvote in
            if didUpvote {
                self.spring.didUpvote = true
            } else {
                self.spring.didUpvote = false
            }
        }
    }
    
    func checkIfUserDownvotedSpring() {
        
        service.checkIfUserDownvotedSpring(spring: spring) { didDownvote in
            if didDownvote {
                self.spring.didDownvote = true
            } else {
                self.spring.didDownvote = false
            }
        }
        
    }
    
    
    
}
