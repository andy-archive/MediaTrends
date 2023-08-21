//
//  URL+Extension.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/19.
//

import Foundation

extension URL {
    static let baseURL = "https://api.themoviedb.org/3"
    static let imageURL = "https://image.tmdb.org/t/p/w500"
    
    static func makeEndpointString(_ endpoint: String) -> String {
        return baseURL + endpoint
    }
}
