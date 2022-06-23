//
//  ImageUploader.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-09.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)") // path to folder
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                // ensure the database write rules set to true ;)
                print("DEBUG: Failed to upload image to firebase with error \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageURL, _ in
                
                guard let imageURL = imageURL?.absoluteString else { return }
                completion(imageURL)

            }
        }
    }
    
}
