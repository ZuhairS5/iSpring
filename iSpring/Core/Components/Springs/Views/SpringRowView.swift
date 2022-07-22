//
//  SpringRowView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-30.
//

import SwiftUI
import Kingfisher

/*
 
 This view represents what a single row of the iSpring feed should look like
 
 */


struct SpringRowView: View {
    @ObservedObject var springRowViewModel : SpringRowViewModel
    
    init(spring: Spring) {
        
        self.springRowViewModel = SpringRowViewModel(spring: spring)
        
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let user = springRowViewModel.spring.user {
                
                // profile image, username and spring text
                HStack(alignment: .top, spacing: 12) {
                    // this circle reprensents the profile picture
                    KFImage(URL(string: user.profileImageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    // user info and spring caption
                    VStack(alignment: .leading, spacing: 5) {
                        Text("@\(user.username)")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                        
                        Text("May 30, 2022")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        
                        Text(springRowViewModel.spring.content)
                            .font(Font.body)
                            .multilineTextAlignment(.leading)
                        
                    }
                    VStack(alignment: .center, spacing: 2) {
                        
                        Image(systemName: "timer")
                        Text("30D")
                        
                    }
                    .padding(.leading)
                    .padding(.leading)
                    
                }
                
            }
            
            // action buttons
            HStack {
                
                // comment button
                Button {
                    // some action here..
                } label: {
                    VStack(alignment: .center, spacing: 2) {
                        Image(systemName: "bubble.left")
                        Text("1")
                    }
                }
                
                Spacer()
                
                // save button
                Button {
                    // some action here..
                } label: {
                    VStack(alignment: .center, spacing: 2) {
                        Image(systemName: "square.and.arrow.down")
                        Text("2")
                    }
                }
                
                Spacer()
                
                // respring button
                Button {
                    // some action here..
                } label: {
                    VStack(alignment: .center, spacing: 2) {
                        Image(systemName: "megaphone")
                        Text("13")
                    }
                }
                
                Spacer()
                
                // upvote button
                Button {
                    springRowViewModel.likeSpring()
                } label: {
                    VStack(alignment: .center, spacing: 2) {
                        Image(systemName: springRowViewModel.spring.didLike ?? false ? "hand.thumbsup.fill" : "hand.thumbsup")
                            .foregroundColor(springRowViewModel.spring.didLike ?? false ? .green : .green)
                        Text("31")
                    }
                }

                Spacer()
                
                // downvote button
                Button {
                    // some action here..
                } label: {
                    VStack(alignment: .center, spacing: 2) {
                        Image(systemName: "hand.thumbsdown")
                        Text("3")
                    }
                }
                
            }
            .padding()
            Divider()
            
        }
        
        
    }
    
}

//struct SpringRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpringRowView()
//    }
//}
