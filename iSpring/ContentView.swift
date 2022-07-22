//
//  ContentView.swift
//  iSpring
//
//  Created by Zuhair Shaikh on 2022-05-16.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    // state objects allow us to keep track of variable changes within the view locally
    @State private var showSideMenu = false
    
    // environment objects allow us to use a variable around the app without initializing repeatedly
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group {
            // if no user logged in or if logged out, prompt login screen
            if viewModel.userSession == nil {
                LoginView()
            } else {
                // user is logged in
                mainInterface
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterface: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showSideMenu ? true : false)
            
            if showSideMenu {
                ZStack {
                    Color(.black)
                        .opacity(showSideMenu ? 0.375 : 0.0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showSideMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showSideMenu ? 0 : -300, y: 0)
                .background(showSideMenu ? Color.white : Color.clear)
                
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showSideMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle()
                            )
                    }
                }
            }
        }
        .onAppear {
            showSideMenu = false
        }
    }
}
