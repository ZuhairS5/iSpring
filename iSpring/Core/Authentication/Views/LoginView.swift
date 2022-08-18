//
//  LoginView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-07.
//

import SwiftUI

struct LoginView: View {
    
    // "@State" keeps track of the variable, if the variables change they signal other pieces of code that use the state variable that the variable has changed, locally on the current view
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // parent VStack
        VStack {
            VStack(alignment: .leading) {
                // the HStack with just a spacer helps stretch the VStack horizontally in order to fit the background
                HStack{Spacer()}
                Text("Hey,\nwelcome back!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260) // this just sets the frame of the VStack block
            .padding(.leading) // ".padding()" helps to add a sliver ~ 20px of space to each side, inside the method you can specify which sides you want padding on, or empty for all sides
            .background(Color(.systemGreen))
            .foregroundColor(.white)
//            .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
            
            VStack(spacing: 40) {
                CustomTextField(imageName: "envelope",
                                placeHolderText: "Email",
                                isSecuredText: false,
                                text: $email)
                CustomTextField(imageName: "person.badge.key",
                                placeHolderText: "Password",
                                isSecuredText: true,
                                text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                // Navigation links is basically a button that goes to another part of the app
                NavigationLink {
                    Text("Forgot password view...")
                } label: {
                    Text("Forgot password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemGreen))
                        .padding(.top)
                        .padding(.trailing, 30)
                }

            }
            
            Button {
                
                viewModel.login(email: email, password: password)
                
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 320, height: 50)
                    .background(Color(.systemGreen))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.375), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink {
                SignUpView()
                    .navigationBarHidden(true)
            } label: {
                Text("Don't have an account? Sign Up")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.systemGreen))
            }
            .padding(.vertical, 32)

        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
