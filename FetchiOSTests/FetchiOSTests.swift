//
//  FetchiOSTests.swift
//  FetchiOSTests
//
//  Created by Adit Hasan on 11/14/23.
//

import XCTest
@testable import FetchiOS

final class FetchiOSTests: XCTestCase {
    
    
    var mockApiSession: MockApiSession<MealsWrapper, APIError>!
    var viewModel: MealViewModel?
    
    override func setUpWithError() throws {
        mockApiSession = MockApiSession<MealsWrapper, APIError>()
        mockApiSession.stub.expectedReturnData = MockData.getMockJSON(fileName: "Meals")
        viewModel = MealViewModel(apiSession: self.mockApiSession)
    }
    
    override func tearDownWithError() throws {
        mockApiSession = nil
    }
    
    func test_loadedMeals() {
        let result = getExpectationWith()
        if result == XCTWaiter.Result.timedOut {
            if case .loaded = viewModel?.state {
                XCTAssertTrue(true)
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_loadedMealsCount() {
        let result = getExpectationWith()
        if result == XCTWaiter.Result.timedOut {
            if case .loaded(let mealWrapper) = viewModel?.state {
                XCTAssert(mealWrapper.meals.count == 64)
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
}
