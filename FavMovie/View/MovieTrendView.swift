//
//  MovieTrandView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MovieTrendView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Today")
                    .font(.title)
                    .fontWeight(.heavy)
                    .shadow(color: .white, radius: 5)
                    .padding([.leading, .top])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (0..<20) { i in
                            MovieInfoView()
                        }
                    }
                    .padding([.bottom, .trailing])
                }
            }
            
            Spacer()
            Divider()
                .background(.white)
            
            VStack(alignment: .leading) {
                Text("Weeks")
                    .font(.title)
                    .fontWeight(.heavy)
                    .shadow(color: .white, radius: 5)
                    .padding([.leading])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (0..<20) { i in
                            MovieInfoView()
                        }
                    }
                    .padding([.bottom, .trailing])                }
                
            }
            Spacer()
        }
        .background(Color("BaseColor"))
    }
}

struct MovieTrandView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTrendView()
    }
}
