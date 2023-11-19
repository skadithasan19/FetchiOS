//
//  MealService.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import Foundation
import Combine

protocol MealService {
    var apiSession: APISessionProtocol { get }
    func mealDetailBy(mealId: String) -> AnyPublisher<MealDetailWrapper, APIError>
}

extension MealService {
    func mealDetailBy(mealId: String) -> AnyPublisher<MealDetailWrapper, APIError> {
        return apiSession.request(with: EndPoint.mealLookUp(mealId))
    }
}
