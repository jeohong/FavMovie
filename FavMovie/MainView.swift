//
//  ContentView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MainView: View {
    @State var select = false
    var body: some View {
        ZStack {
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
                
                WishListView(select: $select)
                    .tabItem {
                        Image(systemName: "star")
                        Text("찜 목록")
                    }
            }
            .accentColor(.white)
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(Color("BaseColor"))
                
                // Use this appearance when scrolling behind the TabView:
                UITabBar.appearance().standardAppearance = appearance
                // Use this appearance when scrolled all the way up:
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            
            if select {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image(systemName: "trash")
                        }
                        .padding([.bottom,
                                  .trailing])
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
