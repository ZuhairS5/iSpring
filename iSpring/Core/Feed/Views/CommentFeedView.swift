//
//  CommentFeedView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-08-11.
//

import SwiftUI

// this will organize the original spring, the comments and ability to add a comment to the spring
struct CommentFeedView: View {
    
    // this is an array of comment objects returned from the view model
    @ObservedObject var commentFeedViewModel: CommentFeedViewModel
    @ObservedObject var springRowViewModel: SpringRowViewModel
    
    init(spring: Spring) {
        
        self.commentFeedViewModel = CommentFeedViewModel(spring: spring)
        self.springRowViewModel = SpringRowViewModel(spring: spring)
        
    }
    
    var body: some View {
        
        ZStack {
            ScrollView {
                LazyVStack {
                    
                    SpringRowView(spring: springRowViewModel.spring).padding(.horizontal)
                    
                    ForEach(commentFeedViewModel.comments) { comment in
                        CommentRowView(comment: comment)
                    }
                    
                }
            }
        }
        
    }
}
