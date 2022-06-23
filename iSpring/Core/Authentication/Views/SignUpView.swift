//
//  SignUpView.swift
//  Test
//
//  Created by Zuhair Shaikh on 2022-06-08.
//

import SwiftUI

struct SignUpView: View {
    
    // "@State" keeps track of the variable, if the variables change they signal other pieces of code that use the state variable that the variable has changed
    @State private var name = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @EnvironmentObject private var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
            // parent VStack
            VStack {
                
                VStack(alignment: .leading) {
                    // the HStack with just a spacer helps stretch the VStack horizontally in order to fit the background
                    HStack{Spacer()}
                    Text("Welcome to iSpring!\nCreate an account")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .frame(height: 180) // this just sets the frame of the VStack block
                .padding(.leading) // ".padding()" helps to add a sliver ~ 20px of space to each side, inside the method you can specify which sides you want padding on, or empty for all sides
                .background(Color(.systemGreen))
                .foregroundColor(.white)
    //            .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
                
                VStack(spacing: 40) {

                    CustomTextField(imageName: "person", placeHolderText: "Full Name", isSecuredText: false, text: $name)
                    CustomTextField(imageName: "envelope", placeHolderText: "Email", isSecuredText: false, text: $email)
                    CustomTextField(imageName: "person.text.rectangle", placeHolderText: "Username", isSecuredText: false, text: $username)
                    CustomTextField(imageName: "key", placeHolderText: "Password", isSecuredText: true, text: $password)
                    
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                VStack(alignment: .center) {
                    
                    Button {
                        viewModel.register(email: email, password: password, fullName: name, username: username)
                    } label: {
                        Text("Sign up")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 320, height: 50)
                            .background(Color(.systemGreen))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .padding()
                    }
                    .shadow(color: .gray.opacity(0.375), radius: 10, x: 0, y: 0)
                    
                    Button {
                        print("Signed in!")
                    } label: {
                        Text("Sign Up Using Google")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 320, height: 50)
                            .background(Color(.white))
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                    .shadow(color: .gray.opacity(0.375), radius: 10, x: 0, y: 0)
                
                    Button {
                        print("Signed in!")
                    } label: {
                        Text("Sign Up Using Facebook")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 320, height: 50)
                            .background(Color(.blue))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .padding()
                    }
                    .shadow(color: .gray.opacity(0.375), radius: 10, x: 0, y: 0)
                    
                    Spacer()
                    
                    NavigationLink {
                        LoginView()
                            .navigationBarHidden(true)
                    } label: {
                        Text("Already have an account? Sign in")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemGreen))
                    }
                    .padding(.vertical, 32)
                    
                }
                
            }
            .ignoresSafeArea()
        }
    }

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
