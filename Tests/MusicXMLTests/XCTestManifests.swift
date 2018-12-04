import XCTest

extension HelloWorldTests {
    static let __allTests = [
        ("testHelloWorld", testHelloWorld),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(HelloWorldTests.__allTests),
    ]
}
#endif
