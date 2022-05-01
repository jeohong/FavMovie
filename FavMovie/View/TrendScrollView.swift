//
//  TrendScrollView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct TrendScrollView: View {
    var body: some View {
        HStack {
            ForEach (0..<20) { i in
                ZStack {
                    Image("poster2").resizable()
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 4))
                        .frame(width: 200, height: 270)
                        .shadow(color: .blue, radius: 5)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                }
            }
        }
        .padding([.bottom, .trailing])
    }
}

struct TrendScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TrendScrollView()
    }
}
