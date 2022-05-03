//
//  ContentView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MainView: View {
    @State private var select = false
    @State private var tabSelection = 1
    
    init() {
        UIToolbar.appearance().barTintColor = UIColor(Color("BaseColor"))
    }
    
    var body: some View {
        if select {
            NavigationView {
                WishListView(select: $select)
                    .navigationBarHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .status) { Text("2개 항목 선택됨").foregroundColor(.white) }
                        ToolbarItem(placement: .bottomBar) {
                            Spacer()
                        }
                        ToolbarItem(placement: .bottomBar) {
                            Button(action: {
                                // 찜 목록에서 제거 구현
                            }) {
                                Image(systemName: "trash")
                                    .imageScale(.large)
                            }
                        }
                    }
            }
        } else {
            TabView(selection: $tabSelection) {
                MovieTrendView()
                    .tabItem {
                        Image(systemName: "waveform.and.magnifyingglass")
                        Text("인기 순위")
                    }.tag(1)
                MovieSearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("영화 검색")
                    }.tag(2)
                WishListView(select: $select)
                    .tabItem {
                        Image(systemName: "star")
                        Text("찜 목록")
                    }.tag(3)
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
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
