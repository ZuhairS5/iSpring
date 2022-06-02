//
//  SpringFeedView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-30.
//

import SwiftUI

struct SpringFeedView: View {
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                ForEach(0 ... 20, id: \.self) { _ in
                    SpringRowView()
                        .padding()
                }
                
            }
            
        }
        
        
    }
}

struct SpringFeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpringFeedView()
    }
}
