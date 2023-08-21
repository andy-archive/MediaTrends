//
//  Movie.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/19.
//

import Foundation

// MARK: - Movie
struct MovieList: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Movie: Codable {
    let adult, video: Bool
    let id, voteCount: Int
    let originalLanguage: String
    let backdropPath, originalTitle, overview, posterPath, releaseDate, title: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity, voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case adult, id, title, overview, popularity, video
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}
