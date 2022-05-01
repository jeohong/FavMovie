//
//  MovieSearchView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MovieSearchView: View {
    @State var searchText = ""
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            Spacer()
        }
        .background(Color("BaseColor"))
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
