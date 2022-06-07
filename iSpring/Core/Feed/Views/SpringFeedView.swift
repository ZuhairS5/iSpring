//
//  SpringFeedView.swift
//  iSpring
//
//  Created by Samhith Sripada on 2022-05-30.
//

import SwiftUI

struct SpringFeedView: View {
    
    @State private var showNewSpringView = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 20, id: \.self) { _ in
                        SpringRowView()
                            .padding()
                    }
                    
                }
                
            }
            
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 40, height: 40)
                
                Button {
                    showNewSpringView.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 40, height: 40)
                        .padding()
                }
                .background(Color(.clear))
                .foregroundColor(.black)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $showNewSpringView) {
                    NewSpringView()
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
