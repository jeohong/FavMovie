//
//  MovieSearchView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MovieSearchView: View {
    var colums = Array(repeating: GridItem(.adaptive(minimum: 180, maximum: 180)), count: 2)
    @State var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            
            // API 결과로 바꿀것
            if self.searchText == "닥터 스트레인지" {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: colums, spacing: 10) {
                        ForEach (0..<20) { i in
                            VStack{
                                MovieInfoView()
                                // API 통신 결과로 바꿀것
                                Text("닥터 스트레인지")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            } else if self.searchText.isEmpty{
                Spacer()
                ResultEmptyView()
                Spacer()
            } else {
                Spacer()
                ResultEmptyNoSearchView()
                Spacer()
            }
        }
        .background(Color("BaseColor"))
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
