//
//  MealDetail.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import Foundation

struct MealDetailWrapper: Decodable {
    var meals: [MealDetail]
}

struct MealDetail: Codable {
    var idMeal: String
    var strMeal: String
    var strDrinkAlternate: String?
    var strCategory: String
    var strArea: String?
    var strInstructions: String
    var strMealThumb: URL?
    var strTags: String?
    var strYoutube: URL?
    
    var strIngredients: [String] = []
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    
    var strMeasures: [String] = []
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    
    var strSource: String?
    var strImageSource: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
    
 
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.idMeal = try container.decode(String.self, forKey: .idMeal)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)?.emptyAsNil()
        self.strCategory = try container.decode(String.self, forKey: .strCategory)
        self.strArea = try container.decodeIfPresent(String.self, forKey: .strArea)?.emptyAsNil()
        self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
        self.strMealThumb = try container.decodeIfPresent(URL.self, forKey: .strMealThumb)
        self.strTags = try container.decodeIfPresent(String.self, forKey: .strTags)?.emptyAsNil()
        self.strYoutube = try container.decodeIfPresent(URL.self, forKey: .strYoutube)
        
        for item in [CodingKeys.strIngredient1,.strIngredient2,.strIngredient3,.strIngredient4,.strIngredient5,
                     .strIngredient6,.strIngredient7,.strIngredient8,.strIngredient9,.strIngredient10,
                     .strIngredient11,.strIngredient12,.strIngredient13,.strIngredient14, .strIngredient15,
                     .strIngredient16,.strIngredient17,.strIngredient18,.strIngredient19,.strIngredient20] {
            if let ingredient = try container.decodeIfPresent(String.self, forKey: item), !ingredient.removewhiteSpace.isEmpty {
                print(ingredient)
                self.strIngredients.append(ingredient)
            }
        }
        
        for item in [CodingKeys.strMeasure1,.strMeasure2,.strMeasure3,.strMeasure4,.strMeasure5,
                     .strMeasure6,.strMeasure7,.strMeasure8,.strMeasure9,.strMeasure10,
                     .strMeasure11,.strMeasure12,.strMeasure13,.strMeasure14,.strMeasure15,
                     .strMeasure16,.strMeasure17,.strMeasure18,.strMeasure19, .strMeasure20] {
            if let measure = try container.decodeIfPresent(String.self, forKey: item), !measure.removewhiteSpace.isEmpty {
                self.strMeasures.append(measure)
            }
        }
       
        self.strSource = try container.decodeIfPresent(String.self, forKey: .strSource)?.emptyAsNil()
        self.strImageSource = try container.decodeIfPresent(String.self, forKey: .strImageSource)?.emptyAsNil()
        self.strCreativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)?.emptyAsNil()
        self.dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)?.emptyAsNil()
    }
}
