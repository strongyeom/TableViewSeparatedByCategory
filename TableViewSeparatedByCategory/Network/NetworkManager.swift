//
//  NetworkManager.swift
//  TableViewSeparatedByCategory
//
//  Created by 염성필 on 2023/09/01.
//

import UIKit

enum NetworkError: Error, CustomDebugStringConvertible {

    case isNotNetwork
    case error
    case isNotParsing
    case isNotData
    
    var debugDescription: String {
        switch self {
        case .isNotNetwork:
            return "isNotNetwork"
        case .error:
            return "완전 에러 발생 "
        case .isNotParsing:
            return "isNotParsing"
        case .isNotData:
            return "isNotData"
        }
    }
   
}



class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }
    
    func callRequest(completionHandler: @escaping (Result<TMDBMedia?,NetworkError>) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?language=ko-KR")!
        var request = URLRequest(url: url, timeoutInterval: 10)
    
        request.allHTTPHeaderFields = [
            "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMjgxYzYzNDBmMTQxN2Y2NjdjNjIzOTI0MDE5NmNiZiIsInN1YiI6IjY0ZDEwM2ZlODUwOTBmMDBjODdlMDU1ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qwlWh7zB9-0Km6Vfkpq_bFyNDtEFr9sn3NHKXF-sl0c",
            "accept" : "application/json"
        ]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
                if let error {
                    print(error)
                    completionHandler(.failure(.error))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                    completionHandler(.failure(.isNotNetwork))
                    return
                }
                
                guard let data = data else {
                    completionHandler(.failure(.isNotData))
                    return
                }
                // 왜? do _ catch 쓰는가? 네트워크 에러가 났을때 catch 문으로 에러를 확인 할 수 있음
                do {
                    let result = try JSONDecoder().decode(TMDBMedia.self, from: data)
                   // print(result)
                    completionHandler(.success(result))
                    
                } catch {
                    completionHandler(.failure(.isNotParsing))
                    print(error)
                }
            
            
        }.resume()
    }
    
   
}

