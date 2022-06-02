//
//  SpringRowView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-30.
//

import SwiftUI

/*
 
 This view represents what a single row of the iSpring feed should look like
 
 */


struct SpringRowView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            // profile image, username and spring text
            HStack(alignment: .top, spacing: 12) {
                // this circle reprensents the profile picture
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color.green)
                
                // user info and spring caption
                VStack(alignment: .leading, spacing: 5) {
                    Text("@Zuhair S")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    
                    Text("May 30, 2022")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                    
                    Text("Arm day is the best day")
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
                
                // like button
                Button {
                    // some action here..
                } label: {
                    VStack(alignment: .center, spacing: 2) {
                        Image(systemName: "hand.thumbsup")
                        Text("31")
                    }
                }

                Spacer()
                
                // dislike button
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

struct SpringRowView_Previews: PreviewProvider {
    static var previews: some View {
        SpringRowView()
    }
}
