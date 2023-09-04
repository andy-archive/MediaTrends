//
//  MovieAPIManager.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/19.
//

import Foundation
//import Alamofire

final class MovieAPIManager {
    
    static let shared = MovieAPIManager()
    
    private init() {}
    
    private let headers = [
        "Authorization": "Bearer \(APIKey.accessToken)",
        "access": "application/json"
    ]
    
    func getTrendingMovies(type: Endpoint, completionHandler: @escaping (MovieList?) -> Void) {
        
        let url = type.requestURL
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                guard error == nil else {
                    print("Failed Request")
                    completionHandler(nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...300).contains(response.statusCode) else {
                    completionHandler(nil)
                    return
                }
                
                guard let data = data else {
                    completionHandler(nil)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(MovieList.self, from: data)
                    completionHandler(result)
                } catch {
                    print(error)
                    completionHandler(nil)
                }
            }
        }.resume()
    }
        
// // Alamofire
//        AF.request(url, method: .get, headers: headers)
//            .validate(statusCode: 200...500)
//            .responseDecodable(of: MovieList.self) { response in
//                switch response.result {
//                case .success(let value):
//                    completionHandler(value)
//                case .failure(let error):
//                    print(error)
//                }
//            }
    
//    func getMovieCredit(type: Endpoint, movieId: Int, completionHandler: @escaping (Credit) -> Void) {
//
//        let url = type.requestURL + String(movieId) + "/credits"
//
//        // Alamofire
//        AF.request(url, method: .get, headers: headers)
//            .validate(statusCode: 200...500)
//            .responseDecodable(of: Credit.self) { response in
//                switch response.result {
//                case .success(let value):
//                    completionHandler(value)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
}
