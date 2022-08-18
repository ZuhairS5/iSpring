//
//  CustomTextField.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-07.
//

import SwiftUI

struct CustomTextField: View {
    
    let imageName: String
    let placeHolderText: String
    let isSecuredText: Bool
    @Binding var text: String
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecuredText {
                    SecureField(placeHolderText, text: $text)
                } else {
                    TextField(placeHolderText, text: $text)
                }
            }
            Divider()
                .background(Color(.darkGray))
        }
        
    }
    
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(imageName: "envelope", placeHolderText: "Email", isSecuredText: false, text: .constant(""))
    }
}
