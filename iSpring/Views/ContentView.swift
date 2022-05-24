//
//  ContentView.swift
//  iSpring
//
//  Created by Zuhair Shaikh on 2022-05-16.
//

import SwiftUI

struct ContentView: View {
    
    // model variable keeps track of changes in the ViewModel object
    @ObservedObject var model = viewModel();
    
    var body: some View {
        
//        List(model.userList) { item in
//
//            Text(item.username)
//
//        }
        
        Text("Hello, world!")
            .padding()
        
    }
    
    init() {
        
        model.getData()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
