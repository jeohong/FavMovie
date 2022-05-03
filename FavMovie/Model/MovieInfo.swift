//
//  MovieInfo.swift
//  FavMovie
//
//  Created by Hong jeongmin on 2022/05/03.
//

let API_KEY = "API key 입력"

// API의 배열을 담을 구조체
struct Response: Codable {
    let page: Int?
    let result: [MovieInfo]
    
    enum CodingKeys: String, CodingKey {
        case page
        case result = "results"
    }
}

// 영화 정보를 담을 구조체
struct MovieInfo: Codable {
    let title: String?
    let rating: Double?
    let summary: String?
    let poster_path: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case rating = "vote_average"
        case summary = "overview"
        case poster_path
    }
}
