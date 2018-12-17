import XCTest

extension DecoderTests {
    static let __allTests = [
        ("testClef", testClef),
        ("testHelloWorld", testHelloWorld),
        ("testKey", testKey),
        ("testMeasure", testMeasure),
        ("testNote", testNote),
        ("testPart", testPart),
        ("testPartList", testPartList),
        ("testPitch", testPitch),
        ("testTime", testTime),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DecoderTests.__allTests),
    ]
}
#endif
