//
//  Meal.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import Foundation

struct MealsWrapper: Codable {
    var meals: [Meal]
}

struct Meal: Codable {
    var strMeal: String
    var strMealThumb: URL?
    var idMeal: String
    
    enum CodingKeys: String, CodingKey {
        case strMeal, strMealThumb, idMeal
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strMealThumb = URL(string: try container.decode(String.self, forKey: .strMealThumb))
        self.idMeal = try container.decode(String.self, forKey: .idMeal)
    }
}
