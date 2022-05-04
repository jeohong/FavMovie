//
//  MovieTrandView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MovieTrendView: View {
    @State private var todayTrend = [MovieInfo]()
    @State private var weeksTrend = [MovieInfo]()
        
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Today")
                    .font(.title)
                    .fontWeight(.heavy)
                    .shadow(color: .white, radius: 5)
                    .padding([.leading, .top])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (todayTrend) { movie in
                            MovieInfoView(movie: movie)
                        }
                    }
                    .padding([.bottom, .trailing])
                }
            }
            
            Spacer()
            Divider()
                .background(.white)
            
            VStack(alignment: .leading) {
                Text("Weeks")
                    .font(.title)
                    .fontWeight(.heavy)
                    .shadow(color: .white, radius: 5)
                    .padding([.leading])
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach (weeksTrend) { movie in
                            MovieInfoView(movie: movie)
                        }
                    }
                    .padding([.bottom, .trailing])
                }
            }
            Spacer()
        }
        .background(Color("BaseColor"))
        .onAppear{
            DispatchQueue.global().async {
                trendAPICall("day") { today in
                    self.todayTrend = today
                }
                trendAPICall("week") { weeks in
                    self.weeksTrend = weeks
                }
            }
        }
    }
    
}

func trendAPICall(_ query: String, completion: @escaping ([MovieInfo]) -> Void) {
    var trendUrl = URLComponents(string: "https://api.themoviedb.org/3/trending/movie/\(query)?")
    
    trendUrl?.queryItems?.append(apiKeyQuery)
    trendUrl?.queryItems?.append(languageQuery)
    
    guard let requestTrendURL = trendUrl?.url else { return }
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let dataTask = session.dataTask(with: requestTrendURL) { data, response, error in
        guard error == nil else { return }
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
        guard let resultData = data else { return }
        
        do {
            let decoder = JSONDecoder()
            let respons =  try decoder.decode(Response.self, from: resultData)
            let trend = respons.result
            completion(trend)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    dataTask.resume()
}

struct MovieTrandView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTrendView()
    }
}
