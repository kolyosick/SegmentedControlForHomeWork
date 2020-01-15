import XCTest
@testable import GithubAPIClient

final class GithubAPIClientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GithubAPIClient().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
