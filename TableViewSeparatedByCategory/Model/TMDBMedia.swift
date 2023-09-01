//
//  TMDBMedia.swift
//  TableViewSeparatedByCategory
//
//  Created by 염성필 on 2023/09/01.
//
import Foundation

// MARK: - TMDBMedia
struct TMDBMedia: Codable {
    
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    // movie 이름
    let title: String?
    // 줄거리
    let overview: String?
    let posterPath: String?
    let mediaType: MediaType?
    let genreIDS: [Int]
    let releaseDate: String?
    let voteAverage: Double?
    // tv 이름
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case name
    }
    
    var imageUrl: String {
        return "https://www.themoviedb.org/t/p/w600_and_h900_bestv2" + posterPath!
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}
