//
//  XCTestCase+Extension.swift
//  FetchiOSTests
//
//  Created by Adit Hasan on 11/15/23.
//

import Foundation
import XCTest
extension XCTestCase {
  func getExpectationWith(time: Int = 5) -> XCTWaiter.Result {
    let expectation = expectation(description: "Test after \(time) seconds")
    let result = XCTWaiter.wait(for: [expectation], timeout: TimeInterval(time))
    return result
  }
}
