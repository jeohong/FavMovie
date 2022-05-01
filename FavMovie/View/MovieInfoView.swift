//
//  TrendScrollView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MovieInfoView: View {
    @State private var showDetails = false
    
    var body: some View {
        ZStack {
            Image("poster2").resizable()
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 4))
                .frame(width: 200, height: 270)
                .shadow(color: .blue, radius: 5)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            
            VStack() {
                HStack() {
                    Spacer()
                    Button(action: {
                        // 찜목록 저장 , 버튼 채워진걸로 바꾸기
                        self.showDetails.toggle()
                        print("\(self.showDetails)")
                    }) {
                        if !self.showDetails {
                            Image(systemName: "star")
                        } else {
                            Image(systemName: "star.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding([.top, .trailing])
                }
                
                Spacer()
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .padding([.bottom, .leading])
                        
                        Text("7.5")
                            .foregroundColor(.white)
                            .padding([.bottom, .leading])
                        
                        Circle()
                            .trim(from: 0, to: 0.75)
                            .stroke(.green, lineWidth: 2)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 30, height: 30)
                            .padding([.bottom, .leading])
                    }
                    Spacer()
                }
            }
        }
    }
}

struct TrendScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoView()
    }
}
