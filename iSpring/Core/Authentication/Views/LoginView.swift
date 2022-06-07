//
//  LoginView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-07.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .leading) {
                HStack{Spacer()}
                Text("Hey,\nwelcome back!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemGreen))
            .foregroundColor(.white)
//            .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
            
            VStack(spacing: 40) {
                TextField("Email", text: $email)
                
                TextField("Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
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
                print("Signed in!")
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
            } label: {
                Text("Don't have an account? Sign Up")
            }
            .padding(.vertical, 25)

            
        }
        .ignoresSafeArea()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
