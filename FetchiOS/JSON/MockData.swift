//
//  MockData.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/15/23.
//

import Foundation

class MockData {
    
    static func getMockJSON(fileName: String) -> Data? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return data
            } catch let error {
                print("Parse error: \(error.localizedDescription)")
                return nil
            }
        } else {
            return nil
        }
    }
    
    static func getMeals() -> MealsWrapper? {
        guard let jsonData = MockData.getMockJSON(fileName: "Meals") else { return nil }
        do {
            return try JSONDecoder().decode(MealsWrapper.self, from: jsonData)
        } catch {
            return nil
        }
    }
    
    static func getMealDetails() -> MealDetailWrapper? {
        guard let jsonData = MockData.getMockJSON(fileName: "MealDetail") else { return nil }
        do {
            return try JSONDecoder().decode(MealDetailWrapper.self, from: jsonData)
        } catch {
            return nil
        }
    }
}
