//
//  CommentRowViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-08-11.
//

import Foundation

class CommentRowViewModel: ObservableObject {
    
    private let service = SpringService()
    @Published var spring: Spring
    
    init(spring: Spring) {
        
        self.spring = spring
        
    }
    
    func comment(comment: String) {
        
        service.uploadComment(spring: spring, comment: comment) {
            // do something with completion - dismiss the text pane
        }
        
    }
        
}
