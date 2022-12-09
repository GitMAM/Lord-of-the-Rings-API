//
//  LordAPITests.swift
//  lordOfRingsSDK_Tests
//
//  Created by Mohamed Ali on 09/12/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import lordOfRingsSDK

class LordAPITests: QuickSpec {
  override func spec() {
    let lordOfTheRingsAPI = LordOfTheRingsAPI(token: "my-api-token")
    
    describe("fetchBooks") {
      it("fetches a list of books") {
        waitUntil { done in
          lordOfTheRingsAPI.fetchBooks { result in
            switch result {
            case .success(let books):
              expect(books).toNot(beNil())
              done()
            case .failure(let error):
              fail("Failed to fetch books: \(error)")
            }
          }
        }
      }
    }
    
    describe("fetchBook(withID:)") {
      it("fetches a single book by ID") {
        waitUntil { done in
          lordOfTheRingsAPI.fetchBook(withID: "some id") { result in
            switch result {
            case .success(let book):
              expect(book.docs.first?.name).to(equal("some name"))
              done()
            case .failure(let error):
              fail("Failed to fetch book: \(error)")
            }
          }
        }
      }
    }
    
    describe("fetchMovies") {
        it("fetches a list of movies") {
          waitUntil { done in
            lordOfTheRingsAPI.fetchMovies { result in
              switch result {
              case .success(let movies):
                expect(movies).toNot(beNil())
                done()
              case .failure(let error):
                fail("Failed to fetch movies: \(error)")
              }
            }
          }
        }
      }
    
    describe("fetchChapters(forBookWithID:)") {
      it("fetches the chapters for a given book by ID") {
        waitUntil { done in
          lordOfTheRingsAPI.fetchChapters(forBookWithID: "some id") { result in
            switch result {
            case .success(let chapters):
              expect(chapters).toNot(beNil())
              done()
            case .failure(let error):
              fail("Failed to fetch chapters: \(error)")
            }
          }
        }
      }
    }
    
    describe("fetchMovie(withID:)") {
      it("fetches a single movie by ID") {
        waitUntil { done in
          lordOfTheRingsAPI.fetchMovie(withID: "some id") { result in
            switch result {
            case .success(let movie):
              expect(movie.docs.first?.name).to(equal("Some name"))
              done()
            case .failure(let error):
              fail("Failed to fetch movie: \(error)")
            }
          }
        }
      }
    }
  }
}
