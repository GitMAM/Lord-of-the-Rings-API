//
//  Networking.swift
//  Nimble
//
//  Created by Mohamed Ali on 08/12/2022.
//

import Foundation

/// Protocol for making HTTP requests.
protocol Networking {
  /// Makes a request to the specified URL with the specified parameters and headers.
  ///
  /// - Parameters:
  ///   - url: The URL to which the request should be made.
  ///   - method: The HTTP method to use for the request.
  ///   - parameters: The parameters to include in the request body. Defaults to `nil`.
  ///   - headers: The headers to include in the request. Defaults to `nil`.
  ///   - responseType: The type that the response data should be decoded to.
  ///   - completion: A completion block to be called with the result of the request.
  func request<T: Decodable>(
    _ url: URL,
    method: HTTPMethod,
    parameters: [String: String]?,
    headers: [String: String]?,
    responseType: T.Type,
    limit: Int?,
    page: Int?,
    completion: @escaping (Result<T, Error>) -> Void
  )
}

