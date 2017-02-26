import XCTest
@testable import swift_array_variations

class swift_array_variationsTests: XCTestCase {
    func test_3_2_Ints() {
        let expect = [[0, 1], [0, 2], [1, 0], [1, 2], [2, 0], [2, 1]]
        let result = Array<Int>(0...2).variations(class: 2)

        XCTAssertEqual(result.count, 6)
        XCTAssertEqual(result.count, expect.count)

        for i in 0..<6 {
            XCTAssertEqual(result[i].count, 2)
            for j in 0...1 {
                XCTAssertEqual(result[i][j], expect[i][j])
            }
        }
    }

    func test_3_3_String() {
        let expect = [
            ["test", "unit-test", "XCTest"],
            ["test", "XCTest", "unit-test"],
            ["unit-test", "test", "XCTest"],
            ["unit-test", "XCTest", "test"],
            ["XCTest", "test", "unit-test"],
            ["XCTest", "unit-test", "test"]
        ]
        let result = ["test", "unit-test", "XCTest"].variations(class: 3)

        XCTAssertEqual(result.count, 6)
        XCTAssertEqual(result.count, expect.count)

        for i in 0..<6 {
            XCTAssertEqual(result[i].count, 3)
            for j in 0...1 {
                XCTAssertEqual(result[i][j], expect[i][j])
            }
        }
    }

    func test_10_6_Ints() {
        let result = Array<Int>(1...10).variations(class: 6)

        XCTAssertEqual(result.count, 151200)

        for i in 0..<151200 {
            XCTAssertEqual(result[i].count, 6)
        }
    }

    static var allTests : [(String, (swift_array_variationsTests) -> () throws -> Void)] {
        return [
            ("test 2-permutation of [0, 1, 2]", test_3_2_Ints),
            ("test 3-permutation of [\"test\", \"unit-test\", \"XCTest\"]", test_3_3_String),
            ("test 6-permutation of 10", test_10_6_Ints),
        ]
    }
}
