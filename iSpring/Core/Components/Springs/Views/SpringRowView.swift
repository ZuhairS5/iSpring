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
    
    @ObservedObject var springRowViewModel: SpringRowViewModel
    @State var timeRemaining = String("--:--")
    var actionsDisabled: Bool
    
    init(spring: Spring, _ actionsDisabled: Bool = false) {
        
        self.springRowViewModel = SpringRowViewModel(spring: spring)
        self.actionsDisabled = actionsDisabled
    }
    
    func timeToExpiry(_ expiryTime: Date) -> String {

        let timeLeft = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: expiryTime)
        
        if timeLeft.hour == 0 && timeLeft.minute == 0 && timeLeft.second ?? 0 > 0 {
            
            return String(format: "%02i", timeLeft.second!)
            
        } else if timeLeft.hour ?? 0 <= 0 && timeLeft.minute ?? 0 <= 0 && timeLeft.second ?? 0 <= 0 {
            
            return String(format: "EXPIRED", timeLeft.second!)

        } else {
            
            return String(format: "%02i:%02i", timeLeft.hour!, timeLeft.minute!)
            
        }

    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                        
                        Text("\(Date(timeIntervalSince1970: TimeInterval(springRowViewModel.spring.timestamp.seconds)).formatted(.dateTime.month(.wide).day().year(.extended())))")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        
                        Text(springRowViewModel.spring.content)
                            .font(Font.body)
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 2) {
                        
                        Image(systemName: "timer")
                        Text(timeRemaining)
                            .onReceive(timer) { _ in
                                timeRemaining = timeToExpiry(springRowViewModel.spring.postExpiry)
                            }
                        
                    }
                    .padding(.leading)
                    
                }
                
            }
            
            // action buttons
            if !actionsDisabled {
                
                HStack {
                    
                    let spring = springRowViewModel.spring
                    
                    // comment button
                    NavigationLink(destination: {
                        CommentFeedView(spring: spring)
                    }, label: {
                        VStack(alignment: .center, spacing: 2) {
                            Image(systemName: "bubble.left")
                            Text("\(spring.replies)")
                        }
                    })
                    
                    Spacer()
                    
                    // save button
                    Button {
                        springRowViewModel.saveSpring()
                    } label: {
                        VStack(alignment: .center, spacing: 2) {
                            Image(systemName: "square.and.arrow.down")
                            Text("\(spring.saves)")
                        }
                    }
                    
                    Spacer()
                    
                    // respring button
                    Button {
                        // some action here..
                    } label: {
                        VStack(alignment: .center, spacing: 2) {
                            Image(systemName: "megaphone")
                            Text("1")
                        }
                    }
                    
                    Spacer()
                    
                    // upvote button
                    Button {
                        springRowViewModel.upvoteSpring()
                    } label: {
                        VStack(alignment: .center, spacing: 2) {
                            Image(systemName: spring.didUpvote ?? false ? "hand.thumbsup.fill" : "hand.thumbsup")
                                .foregroundColor(.green)
                            Text("\(spring.upvotes)")
                        }
                    }

                    Spacer()
                    
                    // downvote button
                    Button {
                        springRowViewModel.downvoteSpring()
                    } label: {
                        VStack(alignment: .center, spacing: 2) {
                            Image(systemName: spring.didDownvote ?? false ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                                .foregroundColor(.red)
                            Text("\(spring.downvotes)")
                        }
                    }
                    
                }
                .padding()
                
            }
            
            Divider()
            
        }
        
    }
    
}
