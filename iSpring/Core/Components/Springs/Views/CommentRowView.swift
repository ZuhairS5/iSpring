//
//  CommentRowView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-08-11.
//

import SwiftUI
import Kingfisher

struct CommentRowView: View {
    
    @ObservedObject var commentRowViewModel: CommentRowViewModel
    
    // the comment view gets the comment and passes the comment to its view model
    init(comment: Comment) {
        
        self.commentRowViewModel = CommentRowViewModel(comment: comment)
        
    }
    
    var body: some View {
        
        VStack {
            
            if let user = commentRowViewModel.comment.user {
                
                // profile image, username and spring text
                HStack(alignment: .top, spacing: 12) {
                    // this circle reprensents the profile picture
                    KFImage(URL(string: user.profileImageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 42, height: 42)
                        .clipShape(Circle())
                    
                    // user info and spring caption
                    VStack(alignment: .leading, spacing: 5) {
                        Text("@\(user.username)")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                        
                        Text("\(Date(timeIntervalSince1970: TimeInterval(commentRowViewModel.comment.timestamp.seconds)).formatted(.dateTime.month(.wide).day().year(.extended())))")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        
                        Text("\(commentRowViewModel.comment.comment)")
                            .font(Font.body)
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                    Spacer()
                    
                }
                .padding()
                
            }
            
            Divider()
            
        }
        
    }
    
}
