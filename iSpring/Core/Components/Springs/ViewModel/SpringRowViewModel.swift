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
        checkIfUserLikedSpring()
    }
    
    func likeSpring() {
        service.likeSpring(spring) {
            self.spring.didLike = true
        }
    }
    
    func checkIfUserLikedSpring() {
        service.checkIfUserLikedSpring(spring: spring) { didLike in
            if didLike {
                self.spring.didLike = true
            }
        }
    }
    
}
