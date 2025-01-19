//
//  MockAPISession.swift
//  FetchiOSTests
//
//  Created by Adit Hasan on 11/15/23.
//

import Combine
import Foundation
@testable import FetchiOS

enum TestSession {
    case feature, upcoming, none
}

struct MockApiSession<Output: Decodable, Failure: Error>: APISessionProtocol {
    class Stub {
        var expectedResult: Result<Output?, APIError> = .success(nil)
        var expectedReturnData: Data!
    }
    var stub = Stub()
    func request<T>(with builder: FetchiOS.RequestBuilder) -> AnyPublisher<T, FetchiOS.APIError> where T : Decodable {
        let urlRequest = EndPoint.mealsCategory("").urlRequest
        if builder.urlRequest == urlRequest {
            return Result.Publisher(APIError.noResponse).eraseToAnyPublisher()
        }

        if case .success = stub.expectedResult {
            let result = try! JSONDecoder().decode(Output.self, from: stub.expectedReturnData)
            if let rr = result as? T {
                return Result.Publisher(rr).eraseToAnyPublisher()
            } else {
                return Result.Publisher(APIError.decodingError(error: NSError(domain: "Decoding Error", code: -1))).eraseToAnyPublisher()
            }
            
        } else if case .failure(let error) = stub.expectedResult {
            return Result.Publisher(error).eraseToAnyPublisher()
        } else {
            fatalError("Bad test data")
        }
    }

    func requestImage(with builder: RequestBuilder) -> AnyPublisher<Data, APIError> {
        Result.Publisher(.failure(APIError.noResponse)).eraseToAnyPublisher()
    }
}
