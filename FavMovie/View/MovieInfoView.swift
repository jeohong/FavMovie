//
//  TrendScrollView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MovieInfoView: View {
    @State private var showDetails = false
    @State private var isModal = false
    let movie: MovieInfo
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(movie.poster_path ?? "")")) { image in
                switch image {
                case .success(let image):
                    image.resizable()
                case .failure(_):
                    Image("noPoster").resizable()
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding()
                @unknown default:
                    ProgressView()
                }
            }
            .onTapGesture { self.isModal.toggle() }
            .sheet(isPresented: self.$isModal) { MovieModalView(movieItem: movie) }
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(.white, lineWidth: 4))
            .frame(width: 170, height: 250)
            .shadow(color: .blue, radius: 5)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            .overlay() {
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
                            
                            Text(String(format: "%.1f", movie.rating!))
                                .foregroundColor(.white)
                                .padding([.bottom, .leading])
                            
                            Circle()
                                .trim(from: 0, to: movie.rating! / 10)
                                .stroke(movie.rating! > 6.9 ? .green : movie.rating! > 2.9 ? .yellow : .red, lineWidth: 2)
                                .rotationEffect(.degrees(-90))
                                .frame(width: 30, height: 30)
                                .padding([.bottom, .leading])
                        }
                        Spacer()
                    }
                }
            }
            Text("\(movie.title!)")
                .bold()
                .foregroundColor(.white)
                .frame(width: 160)
                .lineLimit(1)
        }
    }
}

//struct TrendScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieInfoView()
//    }
//}
