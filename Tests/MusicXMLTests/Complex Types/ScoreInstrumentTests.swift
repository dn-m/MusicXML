//
//  ScoreInstrumentTests.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 9/26/19.
//

import XCTest
import XMLCoder
import MusicXML

class ScoreInstrumentTests: XCTestCase {
    func testDecoding() throws {
        let xml =
        """
        <score-instrument id="P1-I1">
            <instrument-name>Piano</instrument-name>
        </score-instrument>
        """
        let decoded = try MusicXMLDecoder().decode(ScoreInstrument.self, from: xml)
        let expected = ScoreInstrument(id: "P1-I1", name: "Piano")
        XCTAssertEqual(decoded, expected)
    }
}
