//
//  ResultEmptyView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/02.
//

import SwiftUI

struct ResultEmptyNoSearchView: View {
    var body: some View {
        Text("검색 결과가 없습니다.")
            .font(.largeTitle)
            .bold()
            .shadow(color: .white, radius: 5)
    }
}

struct ResultEmptyNoWishListhView: View {
    var body: some View {
        Text("찜 목록이 비었습니다.")
            .font(.largeTitle)
            .bold()
            .shadow(color: .white, radius: 5)
    }
}

struct ResultEmptyView: View {
    var body: some View {
        Text("영화를 검색하세요.")
            .font(.largeTitle)
            .bold()
            .shadow(color: .white, radius: 5)
    }
}
