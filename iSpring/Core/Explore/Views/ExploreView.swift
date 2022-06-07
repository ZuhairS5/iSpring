//
//  ExploreView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-30.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { _ in
                        NavigationLink {
                            ProfileView()
                        } label: {
                            UserRowView()
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .previewInterfaceOrientation(.portrait)
    }
}
