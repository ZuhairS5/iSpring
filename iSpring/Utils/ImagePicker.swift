//
//  ImagePicker.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-09.
//

import Foundation
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    // UIViewControllerRepresentable must have a coordinater to help Swift talk to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        
        
    }
    
}

extension ImagePicker {
    
    // inheritance
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            parent.selectedImage = image
            parent.presentationMode.wrappedValue.dismiss()
        }
        
    }
    
}
