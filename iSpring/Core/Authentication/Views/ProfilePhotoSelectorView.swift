//
//  ProfilePhotoSelectorView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-09.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage? // part of UIKit
    @State private var profileImage: Image? // part of SwiftUI
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                // the HStack with just a spacer helps stretch the VStack horizontally in order to fit the background
                HStack{Spacer()}
                Text("Add a profile photo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260) // this just sets the frame of the VStack block
            .padding(.leading) // ".padding()" helps to add a sliver ~ 20px of space to each side, inside the method you can specify which sides you want padding on, or empty for all sides
            .background(Color(.systemGreen))
            .foregroundColor(.white)
//          .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                        .clipShape(Circle())
                        
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                    viewModel.didAuthenticateUser = true
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 320, height: 50)
                        .background(Color(.systemGreen))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.375), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
            
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .foregroundColor(Color(.systemGreen))
            .frame(width: 180, height: 180)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}


