//
//  MealDetailTests.swift
//  FetchiOSTests
//
//  Created by Adit Hasan on 11/15/23.
//

import XCTest
@testable import FetchiOS

final class MealDetailTests: XCTestCase {
    
    var mockApiSession: MockApiSession<MealsWrapper, APIError>!
    var viewModel: MealDetailViewModel?
    
    override func setUpWithError() throws {
        mockApiSession = MockApiSession<MealsWrapper, APIError>()
        mockApiSession.stub.expectedReturnData = MockData.getMockJSON(fileName: "MealDetail")
        viewModel = MealDetailViewModel(apiSession: self.mockApiSession, mealid: "")
    }
    
    override func tearDownWithError() throws {
        mockApiSession = nil
    }
    
    func test_loadedMealDetailCount() {
        let result = getExpectationWith()
        if result == XCTWaiter.Result.timedOut {
            if case .loaded(let mealDetailWrapper) = viewModel?.state {
                XCTAssert(mealDetailWrapper.meals.count == 1)
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_loadedMealDetail() {
        let result = getExpectationWith()
        if result == XCTWaiter.Result.timedOut {
            if case .loaded(let mealDetailWrapper) = viewModel?.state, let meal = mealDetailWrapper.meals.first {
                XCTAssert(meal.strMeal.isEmpty == false)
                XCTAssert(meal.strCategory == "Dessert")
                XCTAssert(meal.strArea == "British")
                XCTAssert(meal.strInstructions.isEmpty == false)
                XCTAssert(meal.strIngredients.count == 6)
                XCTAssert(meal.strMeasures.count == 6)
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
}
