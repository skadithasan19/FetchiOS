//
//  MealCategoryService.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import Foundation
import Combine

protocol MealCategoryService {
    var apiSession: APISessionProtocol { get }
    func mealsByCategory(category: String) -> AnyPublisher<MealsWrapper, APIError>}

extension MealCategoryService {
    func mealsByCategory(category: String) -> AnyPublisher<MealsWrapper, APIError> {
        return apiSession.request(with: EndPoint.mealsCategory(category))
    }
}
