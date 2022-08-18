//
//  UserRowView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-06.
//

import SwiftUI
import Kingfisher

/*
 
 This view creates a UI tempalte for a row that shows the users details in the explore tab
 
 */

struct UserRowView: View {
    
    let user: User
    
    var body: some View {
        HStack(spacing: 10) {
            
            KFImage(URL(string: user.profileImageURL))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                Text(user.fullName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            } 
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRowView()
//    }
//}
