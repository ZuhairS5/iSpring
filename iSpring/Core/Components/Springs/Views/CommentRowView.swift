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
    init(spring: Spring) {
        
        self.commentRowViewModel = CommentRowViewModel(spring: spring)
        
    }
    
    var body: some View {
        
        VStack {
            
            if let user = commentRowViewModel.spring.user {
                
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
                        Text("@SOME_USER")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                        
                        Text("this is what a comment looks like")
                            .font(Font.body)
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                }
                
                
            }
            
            Divider()
            
        }
        
    }
}
