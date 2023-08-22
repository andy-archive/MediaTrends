//
//  Endpoint.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/19.
//

import Foundation

enum Endpoint {
    case credit
    case trendingDay
    
    var requestURL: String {
        switch self {
        case .credit:
            return URL.makeBaseEndpoint("/movie/")
        case .trendingDay:
            return URL.makeBaseEndpoint("/trending/movie/day?language=en-US")
        }
    }
}
