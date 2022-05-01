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
                    .bold()
                    .padding([.leading, .top])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (0..<10) { i in
                            ZStack {
                                Image("poster").resizable()
                                    .background(Color.blue)
                                    .frame(width: 200, height: 280)
                            }
                        }
                    }
                    .padding([.leading, .bottom])
                }
            }
            Spacer()
            Divider()
            
            VStack(alignment: .leading) {
                Text("Weeks")
                    .font(.title)
                    .bold()
                    .padding([.leading])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (0..<10) { i in
                            ZStack {
                                Image("poster").resizable()
                                    .background(Color.blue)
                                    .frame(width: 200, height: 280)
                                    .padding(.bottom)
                            }
                        }
                    }
                    .padding(.leading)
                }
                
            }
            Spacer()
        }
    }
}

struct MovieTrandView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTrendView()
    }
}
