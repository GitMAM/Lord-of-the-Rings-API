//
//  Network.swift
//  lordOfRingsSDK
//
//  Created by Mohamed Ali on 08/12/2022.
//

import Foundation

/// Class for making HTTP requests using `URLSession`.
final class Network: NSObject, Networking {
  private let token: String
  
  init(token: String) {
    self.token = token
  }
  // MARK: - Networking
  
  /// Makes a request to the specified URL with the specified parameters and headers.
  ///
  /// - Parameters:
  ///   - url: The URL to which the request should be made.
  ///   - method: The HTTP method to use for the request.
  ///   - parameters: The parameters to include in the request body. Defaults to `nil`.
  ///   - headers: The headers to include in the request. Defaults to `nil`.
  ///   - responseType: The type that the response data should be decoded to.
  ///   - completion: A completion block to be called with the result of the request.
  final func request<T: Decodable>(
    _ url: URL,
    method: HTTPMethod,
    parameters: [String: String]? = nil,
    headers: [String: String]? = nil,
    responseType: T.Type,
    limit: Int? = 10,
    page: Int? = nil,
    completion: @escaping (Result<T, Error>) -> Void
  ) {
    
    var requestURL = url
    
    if let limit = limit, let page = page {
      var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
      components?.queryItems = [
        URLQueryItem(name: "limit", value: "\(limit)"),
        URLQueryItem(name: "page", value: "\(page)")
      ]
      requestURL = components?.url ?? url
    }
    
    
    var request = URLRequest(url: requestURL)
    request.httpMethod = method.rawValue
    
    
    if let parameters = parameters {
      request.httpBody = try? JSONEncoder().encode(parameters)
    }
    
    request.addValue(token, forHTTPHeaderField: "Authorization")
    
    if let headers = headers {
      for (key, value) in headers {
        request.addValue(value, forHTTPHeaderField: key)
      }
    }
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let data = data else {
        completion(.failure(NetworkingError.noData))
        return
      }
      
      do {
        let decodedData = try JSONDecoder().decode(responseType, from: data)
        completion(.success(decodedData))
      } catch {
        completion(.failure(error))
      }
    }
    
    task.resume()
  }
}

/// Enum representing errors that can occur during a networking request.
enum NetworkingError: Error {
  /// Indicates that no data was received in the response.
  case noData
}
