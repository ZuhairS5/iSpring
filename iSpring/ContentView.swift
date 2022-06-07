//
//  ContentView.swift
//  iSpring
//
//  Created by Zuhair Shaikh on 2022-05-16.
//

import SwiftUI

struct ContentView: View {
    
//    // model variable keeps track of changes in the ViewModel object
//    @ObservedObject var model = viewModel()
//
//    @State var email = ""
//    @State var password = ""
    
    @State private var showSideMenu = false
    
    var body: some View {
        
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
                Button {
                    withAnimation(.easeInOut) {
                        showSideMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .onAppear {
            showSideMenu = false
        }
        
        
    }
    
//    init() {
//        model.getData()
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
