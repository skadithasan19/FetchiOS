//
//  APISessionProtocol.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/14/23.
//

import Foundation
import Combine

protocol APISessionProtocol {
  func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
