//
//  Books.swift
//  lordOfRingsSDK
//
//  Created by Mohamed Ali on 08/12/2022.
//

import Foundation

/// The `LordOfTheRingsSDK` class provides an interface for consuming the
/// "Lord of the Rings" API.
public final class LordOfTheRingsAPI {
  private let network: Network
  private let baseURL = URL(string: "https://the-one-api.dev/v2")!
    
  public init(token: String) {
    self.network = Network(token: "Bearer \(token)")
  }
  
  /// Fetches a list of books from the API.
  ///
  /// - Parameters:
  ///   - completion: A completion block to be called with the result of the request.
  public final func fetchBooks(completion: @escaping (Result<BookList, Error>) -> Void) {
    let url = baseURL.appendingPathComponent("/book")
    network.request(url, method: .get, responseType: BookList.self) { result in
      switch result {
      case .success(let books):
        completion(.success(books))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  /// Fetches a single book from the API.
  ///
  /// - Parameters:
  ///   - id: The ID of the book to fetch.
  ///   - completion: A completion block to be called with the result of the request.
  public final func fetchBook(withID id: String, completion: @escaping (Result<BookList, Error>) -> Void) {
    let url = baseURL.appendingPathComponent("/book/\(id)")
    network.request(url, method: .get, responseType: BookList.self) { result in
      switch result {
      case .success(let book):
        completion(.success(book))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  /// Fetches a list of movies from the API.
  ///
  /// - Parameters:
  ///   - completion: A completion block to be called with the result of the request.
  public final func fetchMovies(completion: @escaping (Result<MovieList, Error>) -> Void) {
    let url = baseURL.appendingPathComponent("/movie")
    network.request(url, method: .get, responseType: MovieList.self) { result in
      switch result {
      case .success(let movies):
        completion(.success(movies))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  /// Fetches the chapters for a given book from the API.
  ///
  /// - Parameters:
  ///   - id: The ID of the book whose chapters should be fetched.
  ///   - completion: A completion block to be called with the result of the request.
  public final func fetchChapters(forBookWithID id: String, completion: @escaping (Result<ChapterList, Error>) -> Void) {
    let url = baseURL.appendingPathComponent("/book/\(id)/chapter")
    network.request(url, method: .get, responseType: ChapterList.self) { result in
      switch result {
      case .success(let chapters):
        completion(.success(chapters))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  /// Fetches a single movie from the API.
  ///
  /// - Parameters:
  ///   - id: The ID of the movie to fetch.
  ///   - completion: A completion block to be called with the result of the request.
  public final func fetchMovie(withID id: String, completion: @escaping (Result<MovieList, Error>) -> Void) {
    let url = baseURL.appendingPathComponent("/movie/\(id)")
    network.request(url, method: .get, responseType: MovieList.self) { result in
      switch result {
      case .success(let movie):
        completion(.success(movie))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  /// Fetches the quotes for a given movie from the API.
  ///
  /// - Parameters:
  ///   - id: The ID of the movie whose quotes should be fetched.
  ///   - completion: A completion block to be called with the result of the request.
  public final func fetchQuotes(completion: @escaping (Result<QuoteList, Error>) -> Void) {
    let url = baseURL.appendingPathComponent("/quote")
    network.request(url, method: .get, responseType: QuoteList.self) { result in
      switch result {
      case .success(let quotes):
        completion(.success(quotes))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
