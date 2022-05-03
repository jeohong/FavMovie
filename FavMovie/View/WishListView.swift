//
//  WishListView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct WishListView: View {
    @State private var select = false
    @State private var selectOrCancle = "선택"
    var colums = Array(repeating: GridItem(.adaptive(minimum: 180, maximum: 180)), count: 2)
    
    var body: some View {
        VStack{
            HStack{
                VStack {
                    Text("나중에 볼 영화")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .shadow(color: .white, radius: 5)
                        .padding([.leading, .top])
                    Text("3개의 목록")
                        .fontWeight(.heavy)
                        .shadow(color: .white, radius: 5)
                }
                Spacer()
                Button(action:{
                    self.select.toggle()
                    if self.select { self.selectOrCancle = "취소" }
                    else { self.selectOrCancle = "선택" }
                }) {
                    Text("\(self.selectOrCancle)")
                        .fontWeight(.heavy)
                        .shadow(color: .blue, radius: 5)
                }
                .padding(.trailing)
            }
            Spacer()
            
            // coreData or UserDefault로 찜목록에 따라 보여지기
            if !self.select {
                ResultEmptyNoWishListhView()
                Spacer()
            } else {
                ScrollView(showsIndicators: true) {
                    LazyVGrid(columns: colums, spacing: 10) {
                        ForEach (0..<3) { i in
                            VStack{
                                MovieInfoView()
                                // API 통신 결과로 바꿀것
                                Text("닥터 스트레인지")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
        }
        .background(Color("BaseColor"))
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
