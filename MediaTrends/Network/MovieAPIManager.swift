//
//  MovieAPIManager.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/19.
//

import Foundation
import Alamofire

class MovieAPIManager {
    
    static let shared = MovieAPIManager()
    
    private init() {}
    
    let headers: HTTPHeaders = [
        "Authorization": "Bearer \(APIKey.accessToken)",
        "access": "application/json"
    ]
    
    func getTrendingMovies(type: Endpoint, completionHandler: @escaping (MovieList) -> Void) {
        
        let url = type.requestURL
        AF.request(url, method: .get, headers: headers)
            .validate(statusCode: 200...500)
            .responseDecodable(of: MovieList.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
