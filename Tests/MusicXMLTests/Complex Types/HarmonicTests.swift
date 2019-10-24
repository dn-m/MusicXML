//
//  HarmonicTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/24/19.
//

import XCTest
import MusicXML

class HarmonicTests: XCTestCase {

    func testRoundTrip() throws {
        let harmonic = Harmonic(
            naturalArtificial: .natural,
            baseSoundingTouchingPitch: .base,
            printObject: true,
            placement: .above,
            printStyle: PrintStyle(
                position: Position(relativeY: -30),
                color: Color(hexValue: 0x000000)
            )
        )
        try testRoundTrip(harmonic)
    }
}
