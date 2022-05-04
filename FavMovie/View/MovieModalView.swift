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
                .shadow(color: .white, radius: 6)
            
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movieItem.poster_path ?? "")")) { image in
                switch image {
                case .success(let image):
                    image.resizable()
                case .failure(_):
                    Image("noPoster").resizable()
                case .empty:
                    ProgressView()
                @unknown default:
                    ProgressView()
                }
            }
            .frame(width: 200, height: 250, alignment: .center)
            Spacer()
            HStack {
                Text("개봉 : \(movieItem.release_date ?? "미개봉")")
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
            
            Text("\(movieItem.summary ?? "영화사에서 제공한 정보가 없습니다.")")
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing])
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
