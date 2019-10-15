//
//  PickupMeasureChordnamesFiguredBassTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import XCTest
import XMLCoder
import MusicXML

class PickupMeasureChordnamesFiguredBassTests: XCTestCase {

    func testRoot() throws {
        let xml = """
        <root>
          <root-step>C</root-step>
        </root>
        """
        let decoded = try XMLDecoder().decode(Root.self, from: xml.data(using: .utf8)!)
        let expected = Root(step: .c)
        XCTAssertEqual(decoded, expected)
    }

    func testHarmony() throws {
        let xml = """
        <harmony print-frame="no">
            <root>
              <root-step>C</root-step>
            </root>
            <kind>major</kind>
        </harmony>
        """
        let decoded = try XMLDecoder().decode(Harmony.self, from: xml.data(using: .utf8)!)
        let expected = Harmony(
            printFrame: false,
            chords: [
                HarmonyChord(
                    rootOrFunction: .root(Root(step: .c)),
                    kind: Kind(.major)
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testFiguredBassDecoding() throws {
        let xml = """
        <figured-bass>
          <figure><figure-number>3</figure-number></figure>
          <duration>1</duration>
        </figured-bass>
        """
        let decoded = try XMLDecoder().decode(FiguredBass.self, from: xml.data(using: .utf8)!)
        let expected = FiguredBass([Figure(figureNumber: "3")], duration: 1)
        XCTAssertEqual(decoded, expected)
    }
    
    func testFiguredBass() throws {
        try testRoundTrip(FiguredBass([Figure(figureNumber: "3")], duration: 1))
    }
}
