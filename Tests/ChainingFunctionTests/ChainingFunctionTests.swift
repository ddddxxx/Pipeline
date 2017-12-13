import XCTest
@testable import ChainingFunction

class ChainingFunctionTests: XCTestCase {

    func testOptionalArgumentChaining() {
        func f(_ data: Data?) -> Int? {
            return (data, String.Encoding.utf8) ?> String.init(data:encoding:) ?> Double.init ?> Int.init(exactly:)
        }
        
        XCTAssertNil(f(nil))
        XCTAssertNil(f("a".data(using: .utf8)))
        XCTAssertNil(f("0.1".data(using: .utf8)))
        XCTAssertEqual(f("1".data(using: .utf8)), 1)
    }


    static var allTests = [
        ("testOptionalArgumentChaining", testOptionalArgumentChaining),
    ]
}
