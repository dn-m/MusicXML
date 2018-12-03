import XCTest

extension MusicXMLTests {
    static let __allTests = [
        ("testExample", testExample),
    ]
}

extension ParserTests {
    static let __allTests = [
        ("testHelloWorld", testHelloWorld),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MusicXMLTests.__allTests),
        testCase(ParserTests.__allTests),
    ]
}
#endif
