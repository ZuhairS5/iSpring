//
//  ContentView.swift
//  iSpring
//
//  Created by Zuhair Shaikh on 2022-05-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
<<<<<<< Updated upstream
        Text("Hello, Zuhair we did it!")
            .padding()
=======
        
        // test for reading firebase successfully!
//        List(model.userList) { item in
//            Text(item.username)
//        }
        // vertical stack contains banner, posts and navigation bar
        VStack {
            // banner: user profile picture and iSpring Logo
            Group {
                
                ZStack {
                    
                    Rectangle()
                        .size(width: 375, height: 734 / 8)
                        .fill(Color.black)
                        .overlay(alignment: .topLeading) {
                            Spacer()
                            Image("iSpring_logo")
                            Spacer()
                        }
                    
                    
                }
                
            }
            
            
            /*
             
             Post Container:
             - shows user profile picture (or default)
             - username
             - context text
             - time to expiry
             - likes/dislikes/resprings
             
             */
            
            HStack {
                
                
                
            }
            
        }
        
    }
    
    init() {
        
        model.getData()
        
>>>>>>> Stashed changes
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
