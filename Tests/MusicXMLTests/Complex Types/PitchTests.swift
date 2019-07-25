//
//  PitchTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 7/25/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class PitchTests: XCTestCase {

    func testRoundTrip <Value: Codable & Equatable> (
        _ value: Value,
        rootKey: String = "container"
    ) throws {
        let encoded = try XMLEncoder().encode(value, withRootKey: rootKey)
        let decoded = try XMLDecoder().decode(Value.self, from: encoded)
        XCTAssertEqual(decoded, value)
    }

    func testMiddleCRoundTrip() throws {
        try testRoundTrip(Pitch(step: .c, alter: nil, octave: 4))
    }
}
