//
//  DataManager.swift
//  TableViewSeparatedByCategory
//
//  Created by 염성필 on 2023/09/01.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() { }
    
    var tmdbMedia = NetworkManager.shared
    
    var movieData: [Result]?
    var tvData: [Result]?
    
    func callRequest(completionHandler: @escaping([Result?], [Result?]) -> Void) {
        
        tmdbMedia.callRequest { allData in
            self.movieData = allData?.results.filter { $0.mediaType == .movie}
            self.tvData = allData?.results.filter { $0.mediaType == .tv}
            guard let movieData = self.movieData, let tvData = self.tvData else { return }
            completionHandler(movieData, tvData)
        }
        
      
        
    }
}
