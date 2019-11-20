//
//  PitchTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 7/25/19.
//

import MusicXML
import XCTest
import XMLCoder

class PitchTests: XCTestCase {
    func testMiddleCRoundTrip() throws {
        let middleC = Pitch(step: .c, alter: nil, octave: 4)
        try testRoundTrip(middleC, rootKey: "pitch")
    }

    func testHighFQuarterSharpRoundTrip() throws {
        let high = Pitch(step: .f, alter: 0.5, octave: 7)
        try testRoundTrip(high, rootKey: "pitch")
    }
}
