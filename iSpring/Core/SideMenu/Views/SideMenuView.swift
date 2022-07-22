//
//  SideMenuView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-06.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if let user = viewModel.currentUser {
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        // Kingfisher downloads the image from Firebase
                        KFImage(URL(string: user.profileImageURL))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 48, height: 48)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.headline)
                                .foregroundColor(.black)
                                .bold()
                            Text("@\(user.username)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                        }
                        .padding(.trailing)
                        
                        VStack(alignment: .center, spacing: 4) {
                            Image(systemName: "timer")
                            Text("6M")
                        }
                        Spacer()
                    }
                    
                    HStack(alignment: .center, spacing: 24) {
                        HStack(alignment: .center, spacing: 2) {
                            Text("Following:")
                            Text("32")
                                .font(.headline)
                                .bold()
                        }
                        
                        HStack(alignment: .center, spacing: 2) {
                            Text("Followers:")
                            Text("32")
                                .font(.headline)
                                .bold()
                        }
                    }
                    .padding(.vertical)
                    
                }
                .padding(.leading)
                
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { option in
                    
                    if option == .profileOption {
                        NavigationLink {
                            // pass the current user into the profile page
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(viewModel: option)
                        }
                    } else if option == .signOutOption {
                        Button {
                            // this logs the user out and tells the app to update front/back-ends
                            viewModel.logout()
                        } label: {
                            SideMenuOptionRowView(viewModel: option)
                        }
                    } else {
                        SideMenuOptionRowView(viewModel: option)
                    }
                    
                }
                
                Spacer()
            }
            
        }
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
