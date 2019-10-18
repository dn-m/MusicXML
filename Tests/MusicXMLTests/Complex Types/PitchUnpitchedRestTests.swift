//
//  PitchUnpitchedRestTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import XMLCoder
import MusicXML

class PitchUnpitchedRestTests: XCTestCase {

    func testPitch() throws {
        let xml = """
        <container>
            <pitch>
                <step>C</step>
                <alter>-1.5</alter>
                <octave>4</octave>
            </pitch>
        </container>
        """
        let decoded = try MusicXMLDecoder().decode(PitchUnpitchedOrRest.self, from: xml.data(using: .utf8)!)
        let expected = PitchUnpitchedOrRest.pitch(Pitch(step: .c, alter: -1.5, octave: 4))
        XCTAssertEqual(decoded, expected)
    }

    func testUnpitched() throws {

    }

    func testRest() throws {
        let xml = """
        <container>
            <rest></rest>
        </container>
        """
        let decoded = try MusicXMLDecoder().decode(PitchUnpitchedOrRest.self, from: xml.data(using: .utf8)!)
        let expected = PitchUnpitchedOrRest.rest(Rest(/*displayStep: nil, displayOctave: nil, measure: nil*/))
        XCTAssertEqual(decoded, expected)
    }
}
