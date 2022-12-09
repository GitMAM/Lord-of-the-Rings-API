//
//  ModelsTests.swift
//  lordOfRingsSDK_Tests
//
//  Created by Mohamed Ali on 09/12/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import lordOfRingsSDK

class BookSpec: QuickSpec {
  override func spec() {
    describe("Book") {
      it("has the correct properties") {
        let book = Book(id: "the-fellowship-of-the-ring", name: "The Fellowship of the Ring")
        
        expect(book.id).to(equal("the-fellowship-of-the-ring"))
        expect(book.name).to(equal("The Fellowship of the Ring"))
      }
    }
  }
}

class MovieSpec: QuickSpec {
  override func spec() {
    describe("Movie") {
      it("has the correct properties") {
        let movie = Movie(
          id: "the-fellowship-of-the-ring",
          academyAwardNominations: 13,
          academyAwardWins: 4,
          boxOfficeRevenueInMillions: 871.5,
          budgetInMillions: 93,
          name: "The Lord of the Rings: The Fellowship of the Ring",
          rottenTomatoesScore: 92.0,
          runtimeInMinutes: 178
        )

        expect(movie.id).to(equal("the-fellowship-of-the-ring"))
        expect(movie.academyAwardNominations).to(equal(13))
        expect(movie.academyAwardWins).to(equal(4))
        expect(movie.boxOfficeRevenueInMillions).to(equal(871.5))
        expect(movie.budgetInMillions).to(equal(93))
        expect(movie.name).to(equal("The Lord of the Rings: The Fellowship of the Ring"))
        expect(movie.rottenTomatoesScore).to(equal(92.0))
        expect(movie.runtimeInMinutes).to(equal(178))
      }
    }
  }
}

class ChapterListSpec: QuickSpec {
  override func spec() {
    describe("ChapterList") {
      it("has the correct properties") {
        let chapterList = ChapterList(
          docs: [
            Chapter(id: "chapter-1", chapterName: "The Departure of Boromir"),
            Chapter(id: "chapter-2", chapterName: "The Riders of Rohan"),
            Chapter(id: "chapter-3", chapterName: "The Uruk-Hai")
          ],
          limit: 10,
          offset: 0,
          page: 1,
          pages: 1,
          total: 3
        )

        expect(chapterList.docs.count).to(equal(3))
        expect(chapterList.limit).to(equal(10))
        expect(chapterList.offset).to(equal(0))
        expect(chapterList.page).to(equal(1))
        expect(chapterList.pages).to(equal(1))
        expect(chapterList.total).to(equal(3))
      }
    }
  }
}

class QuoteSpec: QuickSpec {
  override func spec() {
    describe("Quote") {
      it("has the correct properties") {
        let quote = Quote(
          id: "quote-1",
          character: "Frodo Baggins",
          dialog: "I will take the Ring, though I do not know the way.",
          movie: "The Fellowship of the Ring"
        )

        expect(quote.id).to(equal("quote-1"))
        expect(quote.character).to(equal("Frodo Baggins"))
        expect(quote.dialog).to(equal("I will take the Ring, though I do not know the way."))
        expect(quote.movie).to(equal("The Fellowship of the Ring"))
      }
    }
  }
}
