//
//  UploadCommentViewModel.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-08-14.
//

import Foundation

class UploadCommentViewModel: ObservableObject {
    
    let service = SpringService()
    @Published var didUploadComment = false
    
    func uploadComment(comment: String, spring: Spring) {
        
        service.uploadComment(spring: spring, comment: comment) { commentUploaded in
            self.didUploadComment = commentUploaded
        }
        
    }
    
    
    
}
