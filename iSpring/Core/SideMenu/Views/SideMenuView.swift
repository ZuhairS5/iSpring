//
//  SideMenuView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-06.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Circle()
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Name")
                            .font(.headline)
                            .foregroundColor(.black)
                            .bold()
                        Text("@username")
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
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: option)
                    }
                } else if option == .signOutOption {
                    Button {
                        print("Handle logout here...")
                    }label: {
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

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
