import XCTest

extension IdentificationDecoderTests {
    static let __allTests = [
        ("testIdentificationMiscellaneousField", testIdentificationMiscellaneousField),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AttributesDecoderTests.__allTests),
        testCase(HelloWorldDecoderTests.__allTests),
        testCase(IdentificationDecoderTests.__allTests),
        testCase(NoteDecoderTests.__allTests),
        testCase(Partwise_01_Pitches.__allTests),
        testCase(ScoreDecoderTests.__allTests),
        testCase(Timewise_01_Pitches.__allTests),
    ]
}
#endif
