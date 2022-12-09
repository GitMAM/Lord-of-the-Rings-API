// https://github.com/Quick/Quick

import Quick
import Nimble
import lordOfRingsSDK


class NetworkingTests: QuickSpec {
  override func spec() {
    describe("JSON decoding") {
      let jsonData = """
        [{"name": "John", "age": 30}, {"name": "Jane", "age": 28}]
      """.data(using: .utf8)!

      it("decodes correctly") {
        let decoder = JSONDecoder()
        let objects = try? decoder.decode([Person].self, from: jsonData)

        expect(objects).toNot(beNil())
        expect(objects).to(haveCount(2))

        let john = objects?[0]
        expect(john).toNot(beNil())
        expect(john?.name).to(equal("John"))
        expect(john?.age).to(equal(30))

        let jane = objects?[1]
        expect(jane).toNot(beNil())
        expect(jane?.name).to(equal("Jane"))
        expect(jane?.age).to(equal(28))
      }
    }
  }
}

fileprivate struct Person: Decodable {
  let name: String
  let age: Int
}
