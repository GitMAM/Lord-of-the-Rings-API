# lordOfRingsSDK

[![CI Status](https://img.shields.io/travis/Mohamed Ali/lordOfRingsSDK.svg?style=flat)](https://travis-ci.org/Mohamed Ali/lordOfRingsSDK)
[![Version](https://img.shields.io/cocoapods/v/lordOfRingsSDK.svg?style=flat)](https://cocoapods.org/pods/lordOfRingsSDK)
[![License](https://img.shields.io/cocoapods/l/lordOfRingsSDK.svg?style=flat)](https://cocoapods.org/pods/lordOfRingsSDK)
[![Platform](https://img.shields.io/cocoapods/p/lordOfRingsSDK.svg?style=flat)](https://cocoapods.org/pods/lordOfRingsSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

lordOfRingsSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'lordOfRingsSDK'
```

## Getting started

To get started, you'll need to first obtain an API token from the Lord of the Rings API website. Once you have a token, you can use it to instantiate an instance of the LordOfTheRingsAPI class:

```swift
let lordOfTheRingsAPI = LordOfTheRingsAPI(token: "my-api-token")
```

## Making requests

Once you have an instance of the LordOfTheRingsAPI class, you can use it to make requests to the API by calling the appropriate methods. For example, you can call the fetchBooks method to get a list of books, or the fetchMovies method to get a list of movies.

Each method takes a completion block as a parameter. This block will be called with the result of the request, which will either be a success or failure. In the case of a success, the result will be an instance of the relevant type (e.g. BookList or MovieList), and in the case of a failure, the result will be an instance of the Error type.

Here is an example of how you might use the LordOfTheRingsAPI class to fetch a list of books:

```swift
lordOfTheRingsAPI.fetchBooks { result in
  switch result {
  case .success(let books):
    // Do something with the list of books
  case .failure(let error):
    // Handle the error
  }
}
```

In this example, we call the fetchBooks method, passing in a completion block to be called with the result of the request. In the completion block, we handle the result of the request by either doing something with the list of books in the case of a success, or handling the error in the case of a failure.


## Testing
There are two main classes for testing the library, NetworkingTests, LordAPITests and ModelsTests in the Tests target, you can run the test individually, by going to the file and tapping the ring on the left or (COMMAND + U)
You will need to configure the LordAPITests by passing the required token and changing the names and the Ids inside the tests


## Author

Mohamed Ali, 73722917+moalimu@users.noreply.github.com

## License

lordOfRingsSDK is available under the MIT license. See the LICENSE file for more info.
