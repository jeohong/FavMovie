//
//  MovieModalView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/04.
//

import SwiftUI

struct MovieModalView: View {
    let movieItem: MovieInfo
    var body: some View {
        VStack {
            Spacer()
            Text("\(movieItem.title!)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .shadow(color: .white, radius: 6)
            
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movieItem.poster_path ?? "")")) { image in
                switch image {
                case .success(let image):
                    image.resizable()
                case .failure(_):
                    Image("noPoster").resizable()
                case .empty:
                    Text("불러오는중...")
                        .foregroundColor(.gray)
                @unknown default:
                    ProgressView()
                }
            }
            .frame(width: 200, height: 300, alignment: .center)
            Spacer()
            HStack {
                Text("개봉 : \(movieItem.release_date!.isEmpty ? "미개봉" : movieItem.release_date!)")
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .white, radius: 5)
                
                Spacer()
                
                Text("평점 : \(String(format: "%.1f", movieItem.rating!))")
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .white, radius: 5)
            }
            .padding([.leading, .trailing])
            Spacer()
            Text("줄거리 정보")
                .font(.largeTitle)
                .foregroundColor(.white)
                .shadow(color: .white, radius: 5)
                .padding(.bottom)
            
            ScrollView {
                Text("\(movieItem.summary!.isEmpty ? "영화사에서 제공한 정보가 없습니다." : movieItem.summary!)")
                    .bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing])
                Spacer()
            }
            Spacer()
        }
        .background(Color("BaseColor"))
    }
}

//struct MovieModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieModalView(movieItem: MovieInfo(title: "Test", rating: 8.0, summary: "Test", poster_path: "", release_date: nil))
//    }
//}
