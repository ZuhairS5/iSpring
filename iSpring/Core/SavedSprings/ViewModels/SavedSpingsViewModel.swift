//
//  SavedSpingsViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-08-14.
//

import Foundation

class SavedSpringsViewModel: ObservableObject {
    
    @Published var savedSprings = [Spring]()
    let springService = SpringService()
    
    init() {
        fetchSavedSprings()
    }
    
    func fetchSavedSprings() {
        
        springService.fetchSavedSprings() { springs in
            self.savedSprings = springs
            print("DEBUG: saved springs fetched in viewModel")
            print("DEBUG: springs \(self.savedSprings)")
        }
        
    }
    
}
