//
//  MainTabView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-30.
//

import SwiftUI

struct MainTabView: View {
    
    // when the user clicks on an icon, the index updates to the corressponding tab instructing the view to change respectively
    @State private var currentTabIndex = 2
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        TabView(selection: $currentTabIndex) {
            // go to explore view
            ExploreView().onTapGesture {
                self.currentTabIndex = 0
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(0)
            
            // go to saved springs view
            SavedSpringsView().onTapGesture {
                self.currentTabIndex = 1
            }
            .tabItem {
                Image(systemName: "square.and.arrow.down")
            }.tag(1)
            
            // go to iSpring feed view
            SpringFeedView().onTapGesture {
                self.currentTabIndex = 2
            }
            .tabItem {
                Image(systemName: "house")
            }.tag(2)
            
            // go to messages view
            MessagesView().onTapGesture {
                self.currentTabIndex = 3
            }
            .tabItem {
                Image(systemName: "paperplane")
            }.tag(3)
            
            // go to notifications view
            NotificationsView().onTapGesture {
                self.currentTabIndex = 4
            }
            .tabItem {
                Image(systemName: "bell")
            }.tag(4)
            
        }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
