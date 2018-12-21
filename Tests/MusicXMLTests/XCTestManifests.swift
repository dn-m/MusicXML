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
        ("testMusicData", testMusicData),
    ]
}

extension IdentificationDecoderTests {
    static let __allTests = [
        ("testIdentificationMiscellaneousField", testIdentificationMiscellaneousField),
    ]
}

extension NoteDecoderTests {
    static let __allTests = [
        ("testMusicData", testMusicData),
        ("testNote", testNote),
        ("testPitch", testPitch),
    ]
}

extension Partwise_01_Pitches {
    static let __allTests = [
        ("testA_Pitches", testA_Pitches),
        ("testB_Intervals", testB_Intervals),
        ("testC_NoVoiceElement", testC_NoVoiceElement),
        ("testD_Microtones", testD_Microtones),
        ("testE_ParenthesizedAccidentals", testE_ParenthesizedAccidentals),
        ("testF_ParenthesizedMicrotoneAccidentals", testF_ParenthesizedMicrotoneAccidentals),
    ]
}

extension ScoreDecoderTests {
    static let __allTests = [
        ("testMeasure", testMeasure),
        ("testPart", testPart),
        ("testPartList", testPartList),
    ]
}

extension Timewise_01_Pitches {
    static let __allTests = [
        ("testA_Pitches", testA_Pitches),
        ("testB_Intervals", testB_Intervals),
        ("testC_NoVoiceElement", testC_NoVoiceElement),
        ("testD_Microtones", testD_Microtones),
        ("testE_ParenthesizedAccidentals", testE_ParenthesizedAccidentals),
        ("testF_ParenthesizedMicrotoneAccidentals", testF_ParenthesizedMicrotoneAccidentals),
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
