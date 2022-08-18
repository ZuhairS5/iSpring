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
    @State private var showNewCommentView = false
    
    init(spring: Spring) {
        
        self.commentFeedViewModel = CommentFeedViewModel(spring: spring)
        self.springRowViewModel = SpringRowViewModel(spring: spring)
        
    }
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    
                    SpringRowView(spring: springRowViewModel.spring).padding(.horizontal)
                    
                    ForEach(commentFeedViewModel.comments) { comment in
                        CommentRowView(comment: comment)
                    }
                    
                }
            }
            
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 40, height: 40)
                
                Button {
                    showNewCommentView.toggle()
                } label: {
                    Image(systemName: "plus.bubble.fill")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 40, height: 40)
                        .padding()
                }
                .background(Color(.clear))
                .foregroundColor(.black)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $showNewCommentView) {
                    NewCommentView(springRowViewModel.spring)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}
