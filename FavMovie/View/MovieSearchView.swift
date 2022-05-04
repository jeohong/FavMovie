//
//  MovieSearchView.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/01.
//

import SwiftUI

struct MovieSearchView: View {
    var colums = Array(repeating: GridItem(.adaptive(minimum: 180, maximum: 180)), count: 2)
    @State private var searchText = ""
    @State private var isSubmit = false
    @State private var searchMovie = [MovieInfo]()
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText, isSubmit: $isSubmit)
                .onSubmit {
                    self.isSubmit = true
                    DispatchQueue.global().async {
                        searchAPICall(self.searchText) { movie in
                            self.searchMovie = movie
                        }
                    }
                }
                .padding(.top)
            
            if self.isSubmit {
                if self.searchMovie.isEmpty {
                    Spacer()
                    ResultEmptyNoSearchView()
                    Spacer()
                }else {
                    ScrollView(showsIndicators: true) {
                        LazyVGrid(columns: colums, spacing: 10) {
                            ForEach (searchMovie) { i in
                                VStack{
                                    MovieInfoView(movie: i)
                                }
                            }
                        }
                    }
                }
            } else {
                Spacer()
                ResultEmptyView()
                Spacer()
            }
        }
        .background(Color("BaseColor"))
    }
}

func searchAPICall(_ query: String, completion: @escaping ([MovieInfo]) -> Void) {
    var searchUrl = URLComponents(string: "https://api.themoviedb.org/3/search/movie?")
    
    let searchQuery = URLQueryItem(name: "query", value: query)
    
    searchUrl?.queryItems?.append(apiKeyQuery)
    searchUrl?.queryItems?.append(languageQuery)
    searchUrl?.queryItems?.append(searchQuery)
    
    guard let requestTrendURL = searchUrl?.url else { return }
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let dataTask = session.dataTask(with: requestTrendURL) { data, response, error in
        guard error == nil else { return }
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
        guard let resultData = data else { return }
        
        do {
            let decoder = JSONDecoder()
            let respons =  try decoder.decode(Response.self, from: resultData)
            let search = respons.result
            completion(search)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    dataTask.resume()
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
