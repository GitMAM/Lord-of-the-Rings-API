//
//  ViewController.swift
//  lordOfRingsSDK
//
//  Created by Mohamed Ali on 12/08/2022.
//  Copyright (c) 2022 Mohamed Ali. All rights reserved.
//

import UIKit
import lordOfRingsSDK

final class ViewController: UIViewController {
  
  let lordOfTheRingsAPI = LordOfTheRingsAPI(token: "my-api-token")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /// fetch books example
    lordOfTheRingsAPI.fetchBooks { result in
      switch result {
      case .success(let books):
        print(books)
      case .failure(let failure):
        print(failure)
      }
    }
    
    /// fetch a  book example
    lordOfTheRingsAPI.fetchBook(withID: "5cf58077b53e011a64671583") { result in
      switch result {
      case .success(let book):

        print(book)
      case .failure(let failure):
        print(failure)
      }
    }
    
    /// fetch movies example
    lordOfTheRingsAPI.fetchMovies { result in
      switch result {
      case .success(let movies):
        print(movies)
      case .failure(let error):
        print(error)
      }
    }
    
    /// fetch a movie example
    lordOfTheRingsAPI.fetchMovie(withID: "5cd95395de30eff6ebccde5d") { result in
      switch result {
      case .success(let movies):
        print(movies)
      case .failure(let error):
        print(error)
      }
    }
    
    /// fetch a chapter example
    lordOfTheRingsAPI.fetchChapters(forBookWithID: "5cf58077b53e011a64671583") { result in
      switch result {
        
      case .success(let books):
        print(books)
      case .failure(let failure):
        print(failure)
      }
    }
    
    /// fetch a qoute example
    lordOfTheRingsAPI.fetchQuotes() { result in
      switch result {
      case .success(let books):
        print(books)
      case .failure(let failure):
        print(failure)
      }
    }
  }
}

