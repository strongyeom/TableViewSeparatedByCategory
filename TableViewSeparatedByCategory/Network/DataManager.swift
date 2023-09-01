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
    
    var movieData: [Result?] = []
    var tvData: [Result?] = []
    
    func callRequest(completionHandler: @escaping([Result?], [Result?]) -> Void) {
        
        tmdbMedia.callRequest { allData in
            
            
            guard let allData else { return }
            
            
            self.movieData = allData.results.filter { $0.mediaType == .movie}
            self.tvData = allData.results.filter { $0.mediaType == .tv}
            
            
            print("Data 여기는 어떻게 탐?",self.movieData, self.tvData)
            completionHandler(self.movieData, self.tvData)
        }
        
      
        
    }
}
