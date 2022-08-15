//
//  NewCommentView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-08-14.
//

import SwiftUI
import Kingfisher

struct NewCommentView: View {
    
    @State var commentText = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var uploadCommentViewModel = UploadCommentViewModel()
    private var spring: Spring
    
    init(_ spring: Spring) {
        
        self.spring = spring
        
    }
    
    var body: some View {
        VStack {
            HStack {
                // cancel button that discards the spring being created
                Button {
                    // the cancel button
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                .foregroundColor(.blue)
                .padding()
                
                Spacer()
                
                // send button publishes the spring onto the platform
                Button {
                    // the send comment button
                    uploadCommentViewModel.uploadComment(comment: commentText, spring: spring)
                    
                } label: {
                    Text("Send")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                }
                .background(commentText.isEmpty ? .gray : .green)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding()
            }
            
            HStack(alignment: .top) {
                if let user = viewModel.currentUser {
                    
                    KFImage(URL(string: user.profileImageURL))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)

                } else {
                    
                    Circle()
                        .frame(width: 64, height: 64)
                    
                }
                
                NewTextArea("Share your comment...", text: $commentText)
                
            }
            .padding()
            
            Spacer()
        }
        .onReceive(uploadCommentViewModel.$didUploadComment) { commentUploaded in
            if commentUploaded {
                presentationMode.wrappedValue.dismiss()
            }
        } // dismisses the sheet when the comment is uploaded successfully
    }
}

