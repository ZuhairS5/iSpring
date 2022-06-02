//
//  ContentView.swift
//  iSpring
//
//  Created by Zuhair Shaikh on 2022-05-16.
//

import SwiftUI

struct ContentView: View {
    
    // model variable keeps track of changes in the ViewModel object
    @ObservedObject var model = viewModel()

    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        // test for reading firebase successfully!
        List(model.userList) { item in
            Text(item.username)
        }
        
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
