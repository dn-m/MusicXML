import XCTest

extension AttributesDecoderTests {
    static let __allTests = [
        ("testClef", testClef),
        ("testKey", testKey),
        ("testTime", testTime),
    ]
}

extension HelloWorldDecoderTests {
    static let __allTests = [
        ("testHelloWorld", testHelloWorld),
    ]
}

extension NoteDecoderTests {
    static let __allTests = [
        ("testNote", testNote),
        ("testPitch", testPitch),
    ]
}

extension ScoreDecoderTests {
    static let __allTests = [
        ("testMeasure", testMeasure),
        ("testPart", testPart),
        ("testPartList", testPartList),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AttributesDecoderTests.__allTests),
        testCase(HelloWorldDecoderTests.__allTests),
        testCase(NoteDecoderTests.__allTests),
        testCase(ScoreDecoderTests.__allTests),
    ]
}
#endif
