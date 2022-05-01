//
//  ContentView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MovieTrendView()
                .tabItem {
                    Image(systemName: "waveform.and.magnifyingglass")
                    Text("인기 순위")
                }
            MovieSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("영화 검색")
                }
            WishListView()
                .tabItem {
                    Image(systemName: "star")
                    Text("찜 목록")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
