//
//  NewSpringView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-07.
//

import SwiftUI

struct NewSpringView: View {
    
    @State private var springText = ""
    // an environment variable that can recognize the presentation state of the app
    @Environment(\.presentationMode) var presentationMode
    
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
                    // the send button
                    print("sent")
                } label: {
                    Text("Send")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                }
                .background(springText.isEmpty ? .gray : .green)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding()
            }
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                NewSpringTextArea("Share your ideas...", text: $springText)
                
            }
            .padding()
            
            Spacer()
        }
        
    }
}

struct NewSpringView_Previews: PreviewProvider {
    static var previews: some View {
        NewSpringView()
    }
}
