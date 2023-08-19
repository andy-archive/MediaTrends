//
//  Endpoint.swift
//  MediaTrends
//
//  Created by Taekwon Lee on 2023/08/19.
//

import Foundation

enum Endpoint {
    case trendingDay
    case credit
    
    var requestURL: String {
        switch self {
        case .trendingDay:
            return URL.makeEndpointString("/trending/movie/day?language=en-US")
        case .credit:
            return URL.makeEndpointString("/credit/")
        }
    }
}
