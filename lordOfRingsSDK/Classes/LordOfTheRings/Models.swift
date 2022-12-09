//
//  BookModels.swift
//  lordOfRingsSDK
//
//  Created by Mohamed Ali on 08/12/2022.
//

import Foundation

public struct BookList: Decodable {
  public let docs: [Book]
  public let limit, offset, page, pages, total: Int
}

public struct Book: Codable {
  public let id: String
  public let name: String
  
  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case name
  }
}


public struct MovieList: Decodable {
  public let docs: [Movie]
  public let limit, offset, page, pages, total: Int
  
}

public struct Movie: Codable {
  public let id: String
  public let academyAwardNominations: Int
  public let academyAwardWins: Int
  public let boxOfficeRevenueInMillions: Double
  public let budgetInMillions: Int
  public let name: String
  public let rottenTomatoesScore: Double
  public let runtimeInMinutes: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case academyAwardNominations
        case academyAwardWins
        case boxOfficeRevenueInMillions
        case budgetInMillions
        case name
        case rottenTomatoesScore
        case runtimeInMinutes
    }
}


public struct ChapterList: Codable {
  public let docs: [Chapter]
  public let limit, offset, page, pages, total: Int
}

public struct Chapter: Codable {
  public let id: String
  public let chapterName: String
  
  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case chapterName
  }
}


public struct QuoteList: Codable {
  public let docs: [Quote]
  public let limit, offset, page, pages, total: Int
}

public struct Quote: Codable {
  public let id: String
  public let character: String
  public let dialog: String
  public let movie: String
  
  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case character, dialog, movie
  }
}

