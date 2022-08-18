//
//  ProfileView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-30.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @ObservedObject var profileViewModel: ProfileViewModel
    
    init(user: User) {
        self.profileViewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ScrollView {
                VStack {
                    headerView.ignoresSafeArea()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        HStack {
                            Text(profileViewModel.user.fullName)
                                .font(.title)
                            .bold()
                            Spacer()
                        }
                        
                        Text("@\(profileViewModel.user.username)")
                        
                    }
                    .padding(.horizontal)
                    
                    profileSpringsView
                    
                }
            }
            
        }
        .navigationBarHidden(false)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               email: "jbezos@amazon.com",
                               fullName: "Jeff Bezos",
                               profileImageURL: "",
                               username: "blueOrginerMarsColonizer"))
    }
}

extension ProfileView {
    var headerView: some View {
        VStack {
            ZStack(alignment: .bottom) {
                // set the background colour
                Color(.systemGreen)
                    .ignoresSafeArea()
                
                // back button returns to previous screen
//                Button {
//                    // some code...
//                } label: {
//                    Image(systemName: "chevron.backward")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 28, height: 21)
//                        .offset(x: -150, y: -100)
//                }
                // the profile picture
//                Circle() // placeholder image
//                    .frame(width: 100, height: 100)
//                    .offset(x: 0, y: -20)
//                .foregroundColor(.white)
                
                KFImage(URL(string: profileViewModel.user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .offset(x: 0, y: -20)
                
            }
            .frame(height: 125)
            Spacer()
        }
        .ignoresSafeArea()
        
    }
    
    var profileSpringsView: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(profileViewModel.springs) { spring in
                    SpringRowView(spring: spring)
                        .padding()
                }
            }
        }
        
    }
    
}
