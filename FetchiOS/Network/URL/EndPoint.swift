//
//  EndPoint.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import Foundation

enum EndPoint {
    case mealsCategory(String)
    case mealLookUp(String)
}

extension EndPoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .mealsCategory(let category):
            guard let url = URL(string: URLs.mealCategoryURL + "?c=\(category)") else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        case .mealLookUp(let mealId):
            guard let url = URL(string: URLs.mealLookupUrL + "?i=\(mealId)") else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        }
    }
}
