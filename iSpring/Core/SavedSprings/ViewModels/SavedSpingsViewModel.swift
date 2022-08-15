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
    let userService = UserService()
    
    func fetchSavedSprings() {
        
        springService.fetchSavedSprings(uuid: <#T##String#>, completion: <#T##([Spring]) -> Void#>)
        
    }
    
}
