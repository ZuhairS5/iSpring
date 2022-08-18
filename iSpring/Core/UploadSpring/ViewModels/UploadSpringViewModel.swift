//
//  UploadSpringViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-07-20.
//

import Foundation

class UploadSpringViewModel: ObservableObject {
    
    let service = SpringService()
    @Published var didUploadSpring = false
    
    func uploadSpring(withCaption caption: String)  {
        
        service.uploadSpring(content: caption) { springUploaded in
            
            self.didUploadSpring = springUploaded
            
        }
        
    }
    
}
