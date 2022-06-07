//
//  UserRowView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-06-06.
//

import SwiftUI


/*
 
 This view creates a UI tempalte for a row that shows the users details in the explore tab
 
 */

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 10) {
            Circle().frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4) {
                Text("Username")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                Text("Name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            } 
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
