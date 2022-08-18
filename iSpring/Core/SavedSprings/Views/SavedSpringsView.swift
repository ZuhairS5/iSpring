//
//  SavedSpringsView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-30.
//

import SwiftUI

struct SavedSpringsView: View {
    
    @ObservedObject var savedSpringsViewModel: SavedSpringsViewModel
    
    init() {
        
        self.savedSpringsViewModel = SavedSpringsViewModel()
        
    }
    
    var body: some View {
        
        VStack {
            
            ForEach(savedSpringsViewModel.savedSprings) { savedSpring in
                
                SpringRowView(spring: savedSpring)
                    .padding()
                
            }
            
        }
        
    }
}
