//
//  ProfileView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-30.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView {
                VStack {
                    headerView.ignoresSafeArea()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        HStack {
                            Text("Zuhair Shaikh")
                                .font(.title)
                            .bold()
                            Spacer()
                        }
                        
                        Text("@orange")
                        
                    }
                    .padding(.horizontal)
                    
                    ForEach(0 ... 20, id: \.self) { _ in
                        SpringRowView()
                            .padding()
                    }
                }
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        VStack {
            ZStack(alignment: .bottom) {
                // set the background colour
                Color(.systemMint)
                    .ignoresSafeArea()
                
                // the profile picture
                // back button returns to previous screen
                Button {
                    // some code...
                } label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 21)
                        .offset(x: -150, y: -100)
                }
                
                Circle()
                    .frame(width: 100, height: 100)
                    .offset(x: 0, y: -20)
                .foregroundColor(.white)
            }
            .frame(height: 125)
            Spacer()
        }
        
    }
    
}
